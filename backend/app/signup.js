import { Router } from "express";
const router = Router();
import { findOne } from "../models/petal";

router.get("/check", function (req, res) {
  findOne({ phone: req.query.phone }, function (err, data) {
    if (err) throw err;
    if (data) res.status(200).send(true);
    else res.status(200).send(false);
  });
});

export default router;
