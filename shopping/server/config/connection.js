// config/connection.js
const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "PhamChiNang1510@*#",
  database: "shopping",
});

connection.connect((err) => {
  if (err) {
    console.error("Lỗi khi kết nối đến cơ sở dữ liệu:", err);
    return;
  }
  console.log("Kết nối thành công đến cơ sở dữ liệu MySQL!");
});

module.exports = connection;
