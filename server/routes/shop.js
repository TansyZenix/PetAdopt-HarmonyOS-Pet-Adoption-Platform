var express = require('express');
var shop = require('./../database/model/shop');
var router = express.Router();

router.get('/', async function (req, res) {
  try {
    var result = await shop.find()
    res.send({ code: 200, message: 'Query successful', data: result })
  }
  catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
})

module.exports = router;
