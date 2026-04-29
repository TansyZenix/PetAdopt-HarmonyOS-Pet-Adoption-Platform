var express = require('express');
var hospital = require('./../database/model/hospital');
var router = express.Router();

router.get('/', async function (req, res) {
  try {
    var result = await hospital.find()
    res.send({ code: 200, message: 'Query successful', data: result })
  }
  catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
})

module.exports = router;
