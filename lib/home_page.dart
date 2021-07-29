import 'package:flutter/material.dart';

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
                  onTap: () async {
                    final response = await Navigator.pushNamed(
                        context, "/create-note",
                        arguments: notes[i]);
                    if (response != null) {
                      var item = response as String;
                      if (item.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = item;
                      }
                      setState(() {});
                    }
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: AddButton(
        notes: notes,
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({
    Key? key,
    required this.notes,
  }) : super(key: key);
  final List notes;
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        final item = await Navigator.pushNamed(context, "/create-note");
        if (item != null) {
          widget.notes.add(item as String);
          setState(() {});
        }
      },
    );
  }
}
