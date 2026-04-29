var express = require('express');
var community = require('./../database/model/community');
var Token = require("./../utils/Token");
var router = express.Router();

router.get('/', async function (req, res) {
  try {
    var result = await community.find()
    res.send({ code: 200, message: 'Query successful', data: result })
  }
  catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
})

router.get('/getByName', async function (req, res) {
  let { userName } = req.query;
  obj = {}
  try {
    obj.userName = userName;
    var result = await community.find(obj)
    res.send({ code: 200, message: 'Success', data: result[0] })
  } catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
})

module.exports = router;
