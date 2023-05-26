const swaggerJSDoc = require("swagger-jsdoc");

const swaggerDefinition = {
  openapi: "3.0.0",
  info: {
    title: "Shopping API",
    version: "1.0.0",
  },
};

const options = {
  swaggerDefinition,
  apis: ["./swagger/swagger_setup.js", "./models/user.js","./models/si"],
};

module.exports = swaggerJSDoc(options);
