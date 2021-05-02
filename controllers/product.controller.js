const productoService = require("../services/product.service.js");
const ExtractJwt = require('passport-jwt').ExtractJwt;

async function getAll(req, res) {
    const result = await productoService.getAll();
    res.status(200).json({status:true, productos:result});
};

async function getById(req, res) {
    console.log(req.query['id']);

    if (req.query['id'] == undefined){
        res.status(400).send({status:false, message:'Wrong parameters'});
    } else{
        const result = await productoService.getById(req.query['id']);
        if(result == null || result == undefined){
            res.status(500).send({ status: false, message: 'Product not found' });
        } else{
            res.status(200).json({status:true, producto: result});
        }        
    } 
    
};

async function add(req, res){
    console.log(req.body);
    const id = req.body['id'];
    const product = await productoService.getById(id);
    if (product == null || product == undefined){
        const result = await productoService.add(req.body,res);
        console.log(result);
        res.status(200).json({status:true});
    } else{
        res.status(400).send({ status: false, message: 'Product already exists' });  
    }
    
}

async function update(req, res){
    console.log(req.body);
    const id = req.body['id'];
    const product = await productoService.getById(id);
    if (!(product == null || product == undefined)){
        const result = await productoService.update(req.body,res);
        console.log(result);
        res.status(200).json({status:true});
    } else{
        res.status(400).send({ status: false, message: 'Product does not exist' });  
    }   
}

async function remove(req, res){
    console.log(req.body);
    const id = req.body['id'];
    const product = await productoService.getById(id);
    if (!(product == null || product == undefined)){
        product.Enabled = 0;
        const result = await productoService.update(product.dataValues,res);
        res.status(200).json({status:true});
    } else{
        res.status(400).send({ status: false, message: 'Product does not exist' });  
    }   
}


module.exports = {getAll, add, getById, update, remove}