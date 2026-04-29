var mongoose = require("../connect");
var Schema = mongoose.Schema
var bannedSchema = new Schema({
    picture: String,
    text1: String,
    text2: String,
    text3: String,
}, {
    versionKey: false
})
var hospitalModel = mongoose.model('hospitals', bannedSchema)
module.exports = hospitalModel
