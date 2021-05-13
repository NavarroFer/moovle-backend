const express = require("express");
const Db = require("./database");
const passport = require("passport");
const cors = require('cors');

const app = express();

const port = 5000;

//config

// This will initialize the passport object on every request
// app.use(passport.initialize());

// Pass the global passport object into the configuration function
// require('./config/passport')(passport);

// Instead of using body-parser middleware, use the new Express implementation of the same thing
app.use(express.json());
app.use(express.urlencoded({extended: true}));


app.use(cors());

// Imports all of the routes from ./routes/index.js
app.use('/moovle',require('./routes'));

const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

main()
  .catch(e => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })

async function main() {
  var cant = 0;
  var productos;
  
//   app.listen(port);
//   console.log("Server listening in " + port);

  productos = await prisma.producto.findMany();
 
  console.log(productos);
}