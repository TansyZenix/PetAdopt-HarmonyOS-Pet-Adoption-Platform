var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/pets')
.then(() => {
    console.log('Database connected successfully');
})
.catch(() => {
    console.log('Database connection failed');
})
module.exports = mongoose;
