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
        onTap: () async {
          final item = await Navigator.pushNamed(context, "/create-note");
          if (item != null) {
            notes.add(item as String);
            setState(() {});
          }
        },
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: 48,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: onTap,
        ));
  }
}
