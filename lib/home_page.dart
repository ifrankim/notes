import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = ["Primeiro item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final item = await Navigator.pushNamed(context, "/create-note");
          print(item);
          if (item != null) {
            notes.add(item as String);
            setState(() {});
          }
        },
      ),
    );
  }
}
