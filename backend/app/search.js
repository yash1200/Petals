import { Router } from "express";
const router = Router();
import { find } from "../models/petal";

router.get("/search", function (req, res) {
  //console.log("Query: " + req.query.q);
  find(
    {
      name: {
        $regex: RegExp(req.query.q),
        $options: "i",
      },
    },
    {
      _id: 1,
      name: 1,
    },
    function (err, data) {
      if (err) {
        res.sendStatus(404);
      }
      res.status(200).send(data);
    }
  ).limit(15);
});

export default router;
