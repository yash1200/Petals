import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String text;
  final intent;

  CustomCard({
    required this.text,
    required this.image,
    this.intent,
  });

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
        height: size.width * 0.47,
        width: size.width * 0.47,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/$image",
                height: size.width * 0.25,
                width: size.width * 0.25,
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
