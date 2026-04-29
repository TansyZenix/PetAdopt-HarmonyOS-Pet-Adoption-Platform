var mongoose = require('./../connect.js');
var Schema = mongoose.Schema;
var petsSchema = new Schema({
    name: String,
    price: String,
    url: String,
});

var pets_Model = mongoose.model('shops', petsSchema);

module.exports = pets_Model;
