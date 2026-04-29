var mongoose = require('./../connect.js');
var petSchema = new mongoose.Schema({
  petTitle: {
    type: String,
  },
  petCategory: {
    type: String,
    default: '猫猫',
    enum: ['猫猫', '狗狗', '其他']
  },
  petName: String,

  petGener: {
    type: String,
    default: '未知',
    enum: ['男孩', '女孩', '未知'],
    alias: 'petGender'
  },
  petAge: {
    type: Number,
    min: 0,
    max: 30,
    get: v => Math.round(v * 10) / 10
  },

  rewardAmount: {
    type: String,
    index: true
  },
  loseTime: {
    type: String,
    index: true
  },
  loseLocation: {
    type: String,
    index: true
  },
  loseDetails: {
    type: String,
    index: true
  },

  contactPublisher: {
    type: String,
  },
  contactPhone: {
    type: String,
  },
  contactWechat: String,
  contactQQ: String,
  showPhone: {
    type: Boolean,
    default: true
  },
  faceToFace: {
    type: Boolean,
    default: true
  },
});

petSchema.index({ petType: 1, createdAt: -1 });

petSchema.virtual('ageDisplay').get(function () {
  return this.petAge < 1 ? `${this.petAge * 12}个月` : `${this.petAge}岁`;
});

module.exports = mongoose.model('deliver2Model', petSchema);
