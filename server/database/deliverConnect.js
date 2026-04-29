var mongoose = require("mongoose");

mongoose.connect("mongodb://localhost:27017/deliver2")
    .then(() => {
        console.log("Database connected successfully!")
    })
    .catch((err) => {
        console.log("Database connection failed!", err)
    })
module.exports = mongoose;
