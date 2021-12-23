import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';
import 'package:notes/home_page.dart';
import 'login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
