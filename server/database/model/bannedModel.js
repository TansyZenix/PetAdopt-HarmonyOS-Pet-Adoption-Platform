var mongoose = require("../connect");
var Schema = mongoose.Schema
var bannedSchema = new Schema({
    _id: String,
    wechat_name: String,
    tel: String,
    report_reason: String,

    detail_name: String,
    detail_sex: String,
    wechat_id: String,
    report_evidence: String
}, {
    versionKey: false
})
var bannedModel = mongoose.model('mines', bannedSchema)
module.exports = bannedModel
