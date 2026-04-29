var express = require('express');
var userModel = require('./../database/model/userModel');
var router = express.Router();
var Token = require("./../utils/Token");

router.post('/apliy', function (req, res) {
  let token = req.headers["authorization"];
  let result = Token.decrypt(token);
  if (result.token) {
    res.send({ code: 200, message: 'Payment successful' })
  } else {
    res.send({ code: 201, message: 'Payment failed' })
  }
})

router.post('/login', async function (req, res) {
  let { userName, userPwd } = req.body

  try {
    let result = await userModel.find({ "userName": userName, "userPwd": userPwd });
    if (result.length > 0) {
      let tokenStr = Token.encrypt({ "userName": result[0].userName }, '2h');
      res.send({ code: 200, message: 'Login successful', token: tokenStr });
    } else {
      res.send({ code: 201, message: 'Login failed' });
    }
  } catch (e) {
    console.error("Error:", e);
    res.send({ code: 500, message: 'Server error' })
  }
});

router.get('/user', async function (req, res, next) {
  let { userName, current, pageSize } = req.query;
  try {
    current = parseInt(current, 10);
    pageSize = parseInt(pageSize, 10);
    let skip = (current - 1) * pageSize;
    var result = await userModel.find({ "userName": new RegExp(userName) }).skip(skip).limit(pageSize);
    res.send({ code: 200, message: 'Query successful', data: result });
  }
  catch (e) {
    console.log(e);
    res.send({ code: 500, message: e })
  }
});

router.post('/add', async function (req, res, next) {
  let { userId, userName, userPwd } = req.query;
  try {
    let result = await userModel.insertMany([{ userId, userName, userPwd }])
    if (result.length > 0) {
      res.send({ code: 200, message: 'User added successfully' });
    } else {
      res.send({ code: 201, message: 'Failed to add user' });
    }
  } catch (err) {
    res.send({ code: 500, message: 'Server error', detailErr: err });
  }
});

router.put('/updateuser', async function (req, res, next) {
  let { _id } = req.query;
  let { userId, userName, userPwd } = req.body;
  let result = await userModel.updateOne({ _id: _id }, { $set: { userId, userName, userPwd } });
  try {
    if (result.modifiedCount > 0) {
      res.send({ code: 200, message: 'User updated successfully' })
    } else {
      res.send({ code: 201, message: 'Failed to update user' })
    }
  } catch (err) {
    res.send({ code: 500, message: 'Failed to update user' });
  }
});

router.delete('/deluser', async function (req, res, next) {
  let { _id } = req.query;
  try {
    let result = await userModel.deleteOne({ _id: _id });
    if (result.deletedCount > 0) {
      res.send({ code: 200, message: 'User deleted successfully' })
    } else {
      res.send({ code: 200, message: 'Failed to delete user' })
    }
  } catch (err) {
    res.send({ code: 500, message: 'Failed to delete user' })
  }
});

module.exports = router;
