import fs from 'fs';
import { sequelize, Categoria, Contenido, Genero, Actor } from '../models/index.js';

let rawData = fs.readFileSync('./database/trailerflix.json', 'utf-8');
if (rawData.includes('\uFFFD')) {
  rawData = fs.readFileSync('./database/trailerflix.json', 'latin1');
}
const data = JSON.parse(rawData);

async function migrar() {
  try {
    await sequelize.sync({ force: true });

    for (const item of data) {
      const [categoria] = await Categoria.findOrCreate({
        where: { nombre: item.categoria.trim() }
      });

      const contenido = await Contenido.create({
        id_contenido: item.id,
        titulo: item.titulo.trim(),
        sinopsis: item.sinopsis.trim(),
        temporadas: typeof item.temporadas === 'number' ? item.temporadas : null,
        trailer: item.trailer ? item.trailer.trim() : null,
        id_categoria: categoria.id_categoria
      });

      const generos = item.genero.split(',').map(g => g.trim());
      for (const nombreGenero of generos) {
        const [genero] = await Genero.findOrCreate({ where: { nombre: nombreGenero } });
        await contenido.addGenero(genero);
      }

      const actores = item.reparto.split(',').map(a => a.trim());
      for (const nombreActor of actores) {
        const [actor] = await Actor.findOrCreate({ where: { nombre: nombreActor } });
        await contenido.addReparto(actor);
      }
    }

    console.log('¡Migración completada! 30 registros cargados correctamente en MySQL.');
  } catch (error) {
    console.error('Error en la migración:', error);
  } finally {
    await sequelize.close();
  }
}

migrar();