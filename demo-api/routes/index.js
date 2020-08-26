var express = require('express');
var router = express.Router();

var cambios = [];



/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/api/cambio', function(req, res, next) {
  cambios.push({"entra":req.body.nroEntra, "sale":req.body.nroSale});
  console.log(cambios);

  res.send({200:"ok"});
});

router.get('/api/cambios', function(req, res, next) {
  res.send(cambios);
});

module.exports = router;
