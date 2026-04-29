var mongoose = require('./../connect.js');
var Schema = mongoose.Schema;
var userSchema = new Schema({
    userId: Number,
    userName: String,
    userPwd: String
});

var userModel = mongoose.model('users', userSchema);

module.exports = userModel;
