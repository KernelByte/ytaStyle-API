const { Model, DataTypes, Sequelize } = require('sequelize');
const { USERS_TABLE } = require('./userModel');
const { GROUPS_TABLE } = require('./groupModel');

// Definimos la tabla
const BUYS_TABLE = 'buys';

// Definimos el esquema de la base de datos
const BuySchema = {
  id_buy: {
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
    type: DataTypes.INTEGER,
  },

  id_group_buy :{
    allowNull: false,
    type: DataTypes.INTEGER,
    references: {
      model: GROUPS_TABLE,
      key: 'id_group',
    },
    onUpdate: 'CASCADE',
    onDelete: 'SET NULL',
  },

  price_buy :{
    type: DataTypes.INTEGER,
  },

  buy_date :{
    type: DataTypes.DATE,
  },

  name_user: {
    type: DataTypes.STRING,
  },

  id_payment_status:{
    type: DataTypes.INTEGER,
    references:{

    }
  },

  id_user_buy:{
    type: DataTypes.INTEGER,
    references: {
      model: USERS_TABLE,
      key: 'id_user',
    },
    onUpdate: 'CASCADE',
    onDelete: 'SET NULL',
  },
};

class Buy extends Model {
  //Metodo para declarar todas las relaciones
  static associate() {
    this.belongsTo(models.User, {
      as: 'user',
    });
  }

  //Metodo para configuracion
  static config(sequelize) {
    return {
      sequelize,
      tableName: BUYS_TABLE,
      modelName: 'Buy',
      timestamps: false,
    };
  }
}

module.exports = { BUYS_TABLE, BuySchema, Buy };
