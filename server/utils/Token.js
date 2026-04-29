const jwt = require("jsonwebtoken");

const JWT_SECRET = process.env.JWT_SECRET || "pet-adopt-platform-secret";

const Token = {
    encrypt: function (data, time) {
        return jwt.sign(data, JWT_SECRET, { expiresIn: time })
    },
    decrypt: function (token) {
        try {
            let data = jwt.verify(token, JWT_SECRET);
            return {
                token: true,
                data: data.id
            };
        } catch (err) {
            return {
                token: false,
                data: err
            }
        }
    }
}

module.exports = Token;
