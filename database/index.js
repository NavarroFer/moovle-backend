const { Sequelize, DataTypes } = require("sequelize");
const initProductModel = require("./models/product.js");

const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: "./moovle.db",
  logging: false,
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.Product = initProductModel(sequelize, DataTypes); 

module.exports = db;
