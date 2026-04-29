var mongoose = require("./../connect");
var Schema = mongoose.Schema
var userSchema = new Schema({
    userName: String,
    title: String,
    avatar: String,
    time: String,
    picture: String,
    tag: String,
    text: String
}, {
    versionKey: false
})
var mycommunity = mongoose.model('mycommunity', userSchema)
module.exports = mycommunity
