const router = require('express').Router();
const productController = require('../controllers/product.controller.js');
const passport = require("passport");

// router.get("/", passport.authenticate('jwt', { session: false }), productController.getAll);
router.get("/", productController.getAll);

// router.get("/", passport.authenticate('jwt', { session: false }), productController.getById);
router.get("/product", productController.getById);

// router.post("/add", passport.authenticate('jwt', { session: false }), productController.add);
router.post("/add", productController.add);

// router.post("/update", passport.authenticate('jwt', { session: false }), productController.update);
router.post("/update", productController.update);

// router.post("/delete", passport.authenticate('jwt', { session: false }), productController.remove);
router.post("/delete", productController.remove);

module.exports = router;