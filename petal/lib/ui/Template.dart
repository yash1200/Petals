import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  final Widget body;
  final onTap;

  Template({this.body, this.onTap});

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: widget.onTap,
          ),
        ],
      ),
      body: widget.body,
    );
  }
}
