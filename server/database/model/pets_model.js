var mongoose = require('./../connect.js');
var Schema = mongoose.Schema;
var petsSchema = new Schema({
    user_id: Number,
    user_name: String,
    user_pwd: String,
    user_age: Number,
});

var pets_Model = mongoose.model('pet_collection', petsSchema);

module.exports = pets_Model;
