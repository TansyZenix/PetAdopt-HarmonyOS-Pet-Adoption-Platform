var mongoose = require('./../connect');

var petSchema = new mongoose.Schema({
  petTitle: {
    type: String,
  },
  petSource: {
    type: String,
    default: '流浪救助',
    enum: ['流浪救助', '家养宠物']
  },
  petType: {
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
  bodyType: {
    type: String,
    enum: ['小型', '中型', '大型', '迷你']
  },
  hairType: {
    type: String,
    enum: ['短毛', '长毛', '卷毛', '无毛']
  },

  vaccineStatus: String,
  sterilizationStatus: String,
  dewormingStatus: String,

  adoptionMethod: {
    type: String,
    default: '无偿',
    enum: ['无偿', '红包', '押金']
  },
  adoptionRequirements: {
    type: [String],
  },
  adoptionLocation: {
    type: String,
    index: true
  },
  selectedTraits: [String],

  storyContent: {
    type: String,
  },

  contactPerson: {
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
});

petSchema.index({ petType: 1, createdAt: -1 });

petSchema.virtual('ageDisplay').get(function () {
  return this.petAge < 1 ? `${this.petAge * 12}个月` : `${this.petAge}岁`;
});

module.exports = mongoose.model('PetModel', petSchema);
