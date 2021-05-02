const Db = require("../database");
const jwt = require("jsonwebtoken");
const { Sequelize } = require("../database");

async function getAll() {
  let products = await Db.Product.findAll();
  return products;
}

async function getById(id) {
  const result = {};
  let product = await Db.Product.findOne({ where: { id: id } });
  console.log(product);
  return product;
}

async function add(req,res){
  let result = true;
  Db.Product.create(req);
  return result;
}

async function update(req,res){
  let result = true;
  console.log(req);
  Db.Product.update(
    req ,
    { where: { id: req['Id']  } }
  );  
  return result;
}

module.exports = {getAll, add, getById, update}