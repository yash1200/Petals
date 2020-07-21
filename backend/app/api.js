const express = require("express");
const router = express.Router();
const Petal = require("../models/petal");

router.get("/petal/:id", function (req, res) {
	Petal.findOne({ _id: req.params.id }).then(function (petal) {
		res.status(200).send(petal);
		console.log("Get Request made");
	});
});

router.get("/petal/owner/:id", function (req, res) {
	Petal.findOne({ ownerId: req.params.id }).then(function (petal) {
		res.status(200).send(petal);
		console.log("Get Owner request made");
	});
});

router.post("/petal", function (req, res) {
	Petal.create(req.body).then((petal) => {
		res.status(200).send(petal);
		console.log("Post Request made");
	});
});

router.put("/petal/:id", function (req, res) {
	Petal.findByIdAndUpdate({ _id: req.params.id }, req.body).then(() => {
		Petal.findOne({ _id: req.params.id }).then(function (petal) {
			res.status(200).send(petal);
			console.log("Restaurent Updated");
		});
	});
});

router.delete("/petal/:id", function (req, res) {
	Petal.findByIdAndRemove({ _id: req.params.id }).then(function (petal) {
		res.status(200).send(petal);
		console.log("Restaurent removed");
	});
});

module.exports = router;
