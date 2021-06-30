import 'package:flutter/material.dart';
import 'package:notes/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      home: HomePage(),
    );
  }
}
