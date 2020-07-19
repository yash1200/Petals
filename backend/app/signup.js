const express = require("express");
const router = express.Router();
const Petal = require("../models/petal");

router.get("/check", function (req, res) {
	Petal.findOne(
		{
			phone: req.query.phone,
		},
		function (err, data) {
            if (err) throw err;
            if(data)
                res.status(200).send(true);
            else
                res.status(200).send(false);
		}
	);
});

module.exports = router;
