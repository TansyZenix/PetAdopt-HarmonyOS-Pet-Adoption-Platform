var express = require('express');
var router = express.Router();
var pets_model = require('./../database/model/pets_model');

router.get('/', async function (req, res) {
  let { pet_class, page_index } = req.query;
  let obj = {};
  try {
    if (pet_class) {
      obj.pet_class = pet_class;
    }
    let result, total, skip;
    let page_size = 2;
    if (pet_class == 1) {
      obj.pet_class = "流浪救助";
      skip = (page_index - 1) * page_size;
      result = await pets_model.find(obj).skip(skip).limit(page_size);
      total = await pets_model.find(obj).countDocuments();
    } else if (pet_class == 2) {
      obj.pet_class = "家养宠物";
      skip = (page_index - 1) * page_size;
      result = await pets_model.find(obj).skip(skip).limit(page_size);
      total = await pets_model.find(obj).countDocuments();
    } else if (pet_class == 0) {
      skip = (page_index - 1) * page_size;
      result = await pets_model.find({}).skip(skip).limit(page_size);
      total = await pets_model.find({}).countDocuments();
    }
    res.send({ code: 0, data: result, message: "Success", count: total });
  } catch (err) {
    console.log(err);
    res.send({ code: 500, message: "Server error", detaiMsg: err });
  }
})

router.get('/getPetById', async function (req, res) {
  let { _id } = req.query;
  try {
    let result = await pets_model.find({ _id: _id });
    res.send({ code: 0, data: result[0], message: "Success" });
  } catch (err) {
    console.log(err);
    res.send({ code: 500, message: "Server error", detaiMsg: err });
  }
})

module.exports = router;
