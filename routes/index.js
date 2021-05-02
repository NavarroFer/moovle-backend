const router = require('express').Router();

router.use('/products', require('./product.routes.js'));

module.exports = router;