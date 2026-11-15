import { DataTypes } from 'sequelize';
import sequelize from '../config/database.js';

const Actor = sequelize.define('Actor', {
  id_actor: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  nombre: { type: DataTypes.STRING(100), allowNull: false, unique: true }
}, { tableName: 'actores', timestamps: false });

export default Actor;