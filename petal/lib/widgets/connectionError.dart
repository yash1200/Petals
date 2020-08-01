import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/error.png',
            height: size.width * 0.4,
            width: size.width * 0.4,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'OOPS! Something went wrong.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
