var express = require('express');
var router = express.Router();
var deliver2Model = require('../database/model/deliver2Model');

router.post('/deliver2', async function (req, res) {
  try {
    const {
      petTitle,
      petCategory,
      petName,
      petGener,
      petAge,
      rewardAmount,
      lostTime,
      lostLocation,
      lostDetails,
      contactPublisher,
      contactPhone,
      contactWechat,
      contactQQ,
      showPhone,
      faceToFace,
    } = req.body;

    if (!petTitle) {
      return res.status(400).json({
        code: 400,
        message: 'Missing required field: petTitle'
      });
    }

    const petData = {
      petTitle,
      petCategory,
      petName,
      petGener,
      petAge,
      rewardAmount,
      lostTime,
      lostLocation,
      lostDetails,
      contactPublisher,
      contactPhone,
      contactWechat,
      contactQQ,
      showPhone,
      faceToFace,
    };

    const result = await deliver2Model.insertMany([{ ...petData }]);

    res.status(201).json({
      code: 201,
      message: 'Published successfully',
    });

  } catch (err) {
    console.error('Publish failed:', err);

    if (err.name === 'ValidationError') {
      const errors = Object.values(err.errors).map(e => ({
        field: e.path,
        message: e.message
      }));

      return res.status(400).json({
        code: 400,
        message: 'Data validation failed',
        errors
      });
    }

    res.status(500).json({
      code: 500,
      message: 'Internal server error',
      detail: process.env.NODE_ENV === 'development' ? err.message : undefined
    });
  }
});

module.exports = router;
