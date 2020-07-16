const express = require("express");
const router = express.Router();
const Petal = require("../models/petal");

router.get("/search", function (req, res) {
	//console.log("Query: " + req.query.q);
	Petal.find(
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

module.exports = router;
