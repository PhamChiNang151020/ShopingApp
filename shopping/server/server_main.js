const express = require("express");
const swaggerUi = require("swagger-ui-express");

const app = express();
const port = 3000;

app.use(express.json());

const userModel = require("./models/user/user_models");

app.get("/api/users", (req, res) => {
  userModel.getUsers((err, results) => {
    if (err) {
      res.status(500).json({ error: "Lỗi khi truy vấn cơ sở dữ liệu" });
      return;
    }
    res.json(results);
  });
});

app.post("/api/signup", function (req, res) {
  const { username, password, email } = req.body;

  userModel.createUser(username, password, email, (err, result) => {
    if (err) {
      console.error("Lỗi khi đăng ký người dùng:", err);
      res.status(500).json({ error: "Lỗi khi đăng ký người dùng" });
      return;
    }

    res.json({ message: "Đăng ký người dùng thành công" });
  });
});

app.post("/api/login", (req, res) => {
  const { username, password } = req.body;

  // Kiểm tra tên đăng nhập và mật khẩu
  if (!username || !password) {
    res.status(400).json({ error: "Vui lòng nhập tên đăng nhập và mật khẩu" });
    return;
  }

  // Kiểm tra thông tin đăng nhập
  userModel.loginUser(username, password, (err, results) => {
    if (err) {
      res.status(500).json({ error: "Lỗi khi đăng nhập" });
      return;
    }

    if (results.length === 0) {
      res.status(401).json({ error: "Thông tin đăng nhập không hợp lệ" });
      return;
    }

    res.json({ message: "Đăng nhập thành công" });
  });
});

app.listen(port, () => {
  console.log(`Server đang chạy tại http://localhost:${port}/api-docs`);
});

const swaggerDocument = require("./swagger/swagger_document.js");
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
