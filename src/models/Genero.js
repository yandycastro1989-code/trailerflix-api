import { DataTypes } from 'sequelize';
import sequelize from '../config/database.js';

const Genero = sequelize.define('Genero', {
  id_genero: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  nombre: { type: DataTypes.STRING(50), allowNull: false, unique: true }
}, { tableName: 'generos', timestamps: false });

export default Genero;