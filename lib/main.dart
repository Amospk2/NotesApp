import 'package:flutter/material.dart';
import 'package:notes/core/inject/inject.dart';
import 'package:notes/features/home/presentation/ui/pages/home_page.dart';

void main() {
  Inject.initialize();
  runApp(const Note());
}

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          appBarTheme: const AppBarTheme(
            color: Colors.red,
            shadowColor: Colors.transparent,
            centerTitle: true,
          )),
      home: const HomePage(),
    );
  }
}
