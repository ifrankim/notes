import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var enteredText = '';
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        enteredText = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = enteredText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.delete), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              onChanged: (newText) {
                setState(() {
                  enteredText = newText;
                });
              },
            ),
            ElevatedButton(
                onPressed: (enteredText == '')
                    ? null
                    : () => {Navigator.pop(context, enteredText)},
                child: Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
