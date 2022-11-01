import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String text;
  const DetailsPage({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Text(
              text,
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
          ),
        )
      ]),
    );
  }
}
