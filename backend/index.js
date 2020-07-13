const express = require("express");
const mongoose = require("mongoose");
const bodyparser = require("body-parser");

const app = express();

mongoose.connect("mongodb://localhost/petal", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useFindAndModify: false,
  useCreateIndex: true,
});
mongoose.Promise = global.Promise;

app.use(bodyparser.json());
app.use("/", require("./app/api"));

app.listen(3000);
