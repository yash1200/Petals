import { Schema as _Schema, model } from "mongoose";
const Schema = _Schema;

const itemSchema = Schema({
  name: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
});

const menuSchema = Schema({
  type: {
    type: String,
    required: true,
  },
  items: [itemSchema],
});

const petalSchema = Schema({
  owner: {
    type: String,
    required: true,
  },
  ownerId: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  phone: {
    type: String,
    required: true,
  },
  email: {
    type: String,
  },
  menus: [menuSchema],
});

const Petal = model("petals", petalSchema);

export default Petal;
