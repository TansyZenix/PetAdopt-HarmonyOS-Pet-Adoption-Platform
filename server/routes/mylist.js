var express = require('express');
var bannedModel = require('./../database/model/bannedModel');
var router = express.Router();

router.get('/getAll', async function (req, res) {
  obj = {}
  try {
    var result = await bannedModel.find({});
    res.send({ code: 200, message: 'Success', data: result })
  }
  catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
})

router.get('/getbyName', async function (req, res) {
  let { wechatName } = req.query;
  obj = {}
  try {
    obj.wechat_name = wechatName;
    var result = await bannedModel.find(obj);
    res.send({ code: 200, message: 'Success', data: result })
  }
  catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
})

module.exports = router;
