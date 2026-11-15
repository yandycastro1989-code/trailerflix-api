import { DataTypes } from 'sequelize';
import sequelize from '../config/database.js';

const Contenido = sequelize.define('Contenido', {
  id_contenido: { type: DataTypes.INTEGER, primaryKey: true },
  titulo: { type: DataTypes.STRING(150), allowNull: false },
  sinopsis: { type: DataTypes.TEXT },
  temporadas: { type: DataTypes.INTEGER, allowNull: true },
  trailer: { type: DataTypes.STRING(255), allowNull: true }
}, { tableName: 'contenido', timestamps: false });

export default Contenido;