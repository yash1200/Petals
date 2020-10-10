import express from "express";
import { connect, Promise } from "mongoose";
import { json } from "body-parser";

const app = express();

connect("mongodb://localhost/petal", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useFindAndModify: false,
  useCreateIndex: true,
});
Promise = global.Promise;

app.use(json());
app.use("/", require("./app/api"));
app.use("/", require("./app/search"));
app.use("/", require("./app/signup"));

app.listen(3000);
