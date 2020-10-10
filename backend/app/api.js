import { Router } from "express";
const router = Router();
import {
  findOne,
  create,
  findByIdAndUpdate,
  findByIdAndRemove,
} from "../models/petal";

router.get("/petal/:id", function (req, res) {
  findOne({ _id: req.params.id }).then(function (petal) {
    res.status(200).send(petal);
    console.log("Get Request made");
  });
});

router.get("/petal/owner/:id", function (req, res) {
  findOne({ ownerId: req.params.id }).then(function (petal) {
    res.status(200).send(petal);
    console.log("Get Owner request made");
  });
});

router.post("/petal", function (req, res) {
  create(req.body).then((petal) => {
    res.status(200).send(petal);
    console.log("Post Request made");
  });
});

router.put("/petal/:id", function (req, res) {
  findByIdAndUpdate({ _id: req.params.id }, req.body).then(() => {
    findOne({ _id: req.params.id }).then(function (petal) {
      res.status(200).send(petal);
      console.log("Restaurent Updated");
    });
  });
});

router.delete("/petal/:id", function (req, res) {
  findByIdAndRemove({ _id: req.params.id }).then(function (petal) {
    res.status(200).send(petal);
    console.log("Restaurent removed");
  });
});

export default router;
