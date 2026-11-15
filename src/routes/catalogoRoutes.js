import { Router } from 'express';
import { Op } from 'sequelize';
import { Contenido, Categoria, Genero, Actor } from '../models/index.js';

const router = Router();

const relaciones = [
  { model: Categoria, as: 'categoria', attributes: ['nombre'] },
  { model: Genero, as: 'generos', attributes: ['nombre'], through: { attributes: [] } },
  { model: Actor, as: 'reparto', attributes: ['nombre'], through: { attributes: [] } }
];

// Función para normalizar tildes (permite buscar "pelicula" o "película")
const normalizarTexto = (texto) =>
  texto.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();

// 1. GET /catalogo - Obtener todo el catálogo
router.get('/catalogo', async (req, res) => {
  try {
    const datos = await Contenido.findAll({
      attributes: { exclude: ['id_categoria'] },
      include: relaciones
    });
    res.status(200).json(datos);
  } catch (error) {
    res.status(500).json({ error: 'Error interno al obtener el catálogo' });
  }
});

// 2. GET /titulo/:title - Buscar por título incluyendo el dato buscado en el 404
router.get('/titulo/:title', async (req, res) => {
  try {
    const { title } = req.params;
    const resultados = await Contenido.findAll({
      where: { titulo: { [Op.like]: `%${title}%` } },
      attributes: { exclude: ['id_categoria'] },
      include: relaciones
    });
    if (!resultados.length) {
      return res.status(404).json({ mensaje: `No se encontraron títulos que coincidan con '${title}'` });
    }
    res.status(200).json(resultados);
  } catch (error) {
    res.status(500).json({ error: 'Error interno al buscar por título' });
  }
});

// 3. GET /categoria/:cat - Filtrar por categoría normalizando tildes
router.get('/categoria/:cat', async (req, res) => {
  try {
    const catBuscada = normalizarTexto(req.params.cat);
    const todoElCatalogo = await Contenido.findAll({
      attributes: { exclude: ['id_categoria'] },
      include: relaciones
    });

    const resultados = todoElCatalogo.filter(
      (item) => item.categoria && normalizarTexto(item.categoria.nombre).includes(catBuscada)
    );

    if (!resultados.length) {
      return res.status(404).json({ mensaje: `No se encontraron contenidos para la categoría '${req.params.cat}'` });
    }
    res.status(200).json(resultados);
  } catch (error) {
    res.status(500).json({ error: 'Error interno al filtrar por categoría' });
  }
});

// 4. GET /reparto/:act - Devolver SOLO titulo y reparto usando .map()
router.get('/reparto/:act', async (req, res) => {
  try {
    const { act } = req.params;
    const resultados = await Contenido.findAll({
      attributes: ['titulo'],
      include: [
        {
          model: Actor,
          as: 'reparto',
          attributes: ['nombre'],
          through: { attributes: [] },
          where: { nombre: { [Op.like]: `%${act}%` } }
        }
      ]
    });

    if (!resultados.length) {
      return res.status(404).json({ mensaje: `No se encontraron producciones para el actor o actriz '${act}'` });
    }

    const respuestaFormateada = resultados.map((item) => ({
      titulo: item.titulo,
      reparto: item.reparto.map((actor) => actor.nombre).join(', ')
    }));

    res.status(200).json(respuestaFormateada);
  } catch (error) {
    res.status(500).json({ error: 'Error interno al buscar por reparto' });
  }
});

// 5. GET /trailer/:id - Separar ID inexistente de título sin tráiler
router.get('/trailer/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const item = await Contenido.findByPk(id, {
      attributes: ['id_contenido', 'titulo', 'trailer']
    });
    if (!item) {
      return res.status(404).json({ mensaje: `No se encontró ningún contenido con el ID ${id}` });
    }
    if (!item.trailer) {
      return res.status(404).json({ mensaje: `El título '${item.titulo}' (ID ${id}) no dispone de tráiler` });
    }
    res.status(200).json(item);
  } catch (error) {
    res.status(500).json({ error: 'Error interno al obtener el tráiler' });
  }
});

// 6. POST /catalogo - Crear nueva película o serie
router.post('/catalogo', async (req, res) => {
  try {
    const { id_contenido, titulo, sinopsis, temporadas, trailer, categoria, generos, reparto } = req.body;

    if (!id_contenido || !titulo || !categoria) {
      return res.status(400).json({ error: 'Los campos id_contenido, titulo y categoria son obligatorios' });
    }

    const existe = await Contenido.findByPk(id_contenido);
    if (existe) {
      return res.status(409).json({ error: `Ya existe un contenido con el ID ${id_contenido}` });
    }

    const [catObj] = await Categoria.findOrCreate({ where: { nombre: categoria.trim() } });

    const nuevoContenido = await Contenido.create({
      id_contenido,
      titulo: titulo.trim(),
      sinopsis: sinopsis || '',
      temporadas: typeof temporadas === 'number' ? temporadas : null,
      trailer: trailer || null,
      id_categoria: catObj.id_categoria
    });

    if (Array.isArray(generos)) {
      for (const nombreGen of generos) {
        const [genObj] = await Genero.findOrCreate({ where: { nombre: nombreGen.trim() } });
        await nuevoContenido.addGenero(genObj);
      }
    }

    if (Array.isArray(reparto)) {
      for (const nombreAct of reparto) {
        const [actObj] = await Actor.findOrCreate({ where: { nombre: nombreAct.trim() } });
        await nuevoContenido.addReparto(actObj);
      }
    }

    res.status(201).json({ mensaje: 'Contenido creado con éxito', contenido: nuevoContenido });
  } catch (error) {
    res.status(500).json({ error: 'Error al crear el contenido', detalle: error.message });
  }
});

// 7. PUT /catalogo/:id - Actualizar un contenido existente
router.put('/catalogo/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const item = await Contenido.findByPk(id);
    if (!item) {
      return res.status(404).json({ mensaje: `No se encontró ningún contenido con el ID ${id}` });
    }

    const { titulo, sinopsis, temporadas, trailer, categoria } = req.body;

    if (categoria) {
      const [catObj] = await Categoria.findOrCreate({ where: { nombre: categoria.trim() } });
      item.id_categoria = catObj.id_categoria;
    }

    if (titulo !== undefined) item.titulo = titulo.trim();
    if (sinopsis !== undefined) item.sinopsis = sinopsis;
    if (temporadas !== undefined) item.temporadas = typeof temporadas === 'number' ? temporadas : null;
    if (trailer !== undefined) item.trailer = trailer;

    await item.save();
    res.status(200).json({ mensaje: `Contenido con ID ${id} actualizado correctamente`, contenido: item });
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar el contenido' });
  }
});

// 8. DELETE /catalogo/:id - Eliminar un contenido por ID
router.delete('/catalogo/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const item = await Contenido.findByPk(id);
    if (!item) {
      return res.status(404).json({ mensaje: `No se encontró ningún contenido con el ID ${id}` });
    }

    await item.setGeneros([]);
    await item.setReparto([]);
    await item.destroy();

    res.status(200).json({ mensaje: `Contenido con ID ${id} eliminado correctamente` });
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar el contenido' });
  }
});

export default router;