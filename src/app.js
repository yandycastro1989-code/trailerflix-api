import express from 'express';
import dotenv from 'dotenv';
import { sequelize } from './models/index.js';
import catalogoRoutes from './routes/catalogoRoutes.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3008;

app.use(express.json());

// Ruta de bienvenida
app.get('/', (req, res) => {
  res.json({
    proyecto: 'Trailerflix API',
    endpoints: [
      'GET /catalogo',
      'GET /titulo/:title',
      'GET /categoria/:cat',
      'GET /reparto/:act',
      'GET /trailer/:id'
    ]
  });
});

// Rutas principales
app.use('/', catalogoRoutes);

// Manejo de rutas inexistentes (404)
app.use((req, res) => {
  res.status(404).json({ error: 'Endpoint no encontrado' });
});

// Iniciar conexión y servidor
async function iniciarServidor() {
  try {
    await sequelize.authenticate();
    console.log('Conexión a MySQL establecida correctamente.');
    app.listen(PORT, () => {
      console.log(`Servidor corriendo en http://localhost:${PORT}`);
    });
  } catch (error) {
    console.error('No se pudo conectar a la base de datos:', error);
  }
}

iniciarServidor();