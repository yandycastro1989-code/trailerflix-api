import sequelize from '../config/database.js';
import Categoria from './Categoria.js';
import Contenido from './Contenido.js';
import Genero from './Genero.js';
import Actor from './Actor.js';

// Relación 1:N (Categoria -> Contenido)
Categoria.hasMany(Contenido, { foreignKey: 'id_categoria' });
Contenido.belongsTo(Categoria, { foreignKey: 'id_categoria', as: 'categoria' });

// Relación N:M (Contenido <-> Genero)
Contenido.belongsToMany(Genero, {
  through: 'contenido_generos',
  foreignKey: 'id_contenido',
  otherKey: 'id_genero',
  timestamps: false,
  as: 'generos'
});
Genero.belongsToMany(Contenido, {
  through: 'contenido_generos',
  foreignKey: 'id_genero',
  otherKey: 'id_contenido',
  timestamps: false
});

// Relación N:M (Contenido <-> Actor)
Contenido.belongsToMany(Actor, {
  through: 'contenido_actores',
  foreignKey: 'id_contenido',
  otherKey: 'id_actor',
  timestamps: false,
  as: 'reparto'
});
Actor.belongsToMany(Contenido, {
  through: 'contenido_actores',
  foreignKey: 'id_actor',
  otherKey: 'id_contenido',
  timestamps: false
});

export { sequelize, Categoria, Contenido, Genero, Actor };