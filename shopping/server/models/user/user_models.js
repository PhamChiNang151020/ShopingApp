// models/userModel.js
const mysql = require("mysql2");

const connection = require("../../config/connection");

function getUsers(callback) {
  connection.query("SELECT * FROM shopping.users", (err, results) => {
    if (err) {
      console.error("Lỗi khi truy vấn cơ sở dữ liệu:", err);
      callback(err, null);
      return;
    }
    callback(null, results);
  });
}

function createUser(username, password, email, callback) {
  const sql =
    "INSERT INTO shopping.users (username, password, email) VALUES (?,?,?)";
  connection.query(sql, [username, password, email], (err, result) => {
    if (err) {
      console.error("Lỗi khi thêm người dùng vào cơ sở dữ liệu:", err);
      callback(err, null);
      return;
    }
    callback(null, result);
  });
}

function loginUser(username, password, callback) {
  const sql =
    "SELECT * FROM shopping.users WHERE username = ? AND password = ?";
  connection.query(sql, [username, password], (err, results) => {
    if (err) {
      console.error("Lỗi khi truy vấn cơ sở dữ liệu:", err);
      callback(err, null);
      return;
    }
    callback(null, results);
  });
}
module.exports = {
  getUsers,
  createUser,
  loginUser,
};
