import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String image, text;
  var intent;

  CustomCard({this.text, this.image, this.intent});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return intent;
            },
          ),
        );
      },
      child: Container(
        height: size.width * 0.45,
        width: size.width * 0.45,
        child: Card(
          child: Column(
            children: [
              Image.asset(
                "assets/$image",
                height: size.width * 0.3,
                width: size.width * 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
