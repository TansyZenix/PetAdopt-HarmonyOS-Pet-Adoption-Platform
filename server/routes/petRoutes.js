var express = require('express');
var router = express.Router();
var PetModel = require('../database/model/PetModel');

router.post('/petsongyang', async function (req, res) {
  try {
    const {
      petTitle,
      petSource = '流浪救助',
      petType = '猫猫',
      petName,
      petGener,
      petAge,
      vaccineStatus,
      sterilizationStatus,
      dewormingStatus,
      bodyType,
      hairType,
      selectedTraits = [],
      adoptionRequirements = [],
      adoptionLocation,
      storyContent,
      contactPerson,
      contactPhone,
      contactWechat,
      contactQQ,
      showPhone = true
    } = req.body;

    if (!petTitle) {
      return res.status(400).json({
        code: 400,
        message: 'Missing required field: petTitle'
      });
    }

    const petData = {
      petTitle,
      petSource,
      petType,
      petName,
      petGener: petGener || 'Unknown',
      petAge: Number(petAge) || 0,
      vaccineStatus: Boolean(vaccineStatus),
      sterilizationStatus: Boolean(sterilizationStatus),
      dewormingStatus: Boolean(dewormingStatus),
      bodyType,
      hairType,
      selectedTraits,
      adoptionRequirements,
      adoptionLocation,
      storyContent: storyContent?.slice(0, 1000),
      contactPerson,
      contactPhone,
      contactWechat,
      contactQQ,
      showPhone,
    };

    const result = await PetModel.insertMany([{ ...petData }]);

    res.status(201).json({
      code: 201,
      message: 'Pet information added successfully',
    });

  } catch (err) {
    console.error('Add failed:', err);

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
