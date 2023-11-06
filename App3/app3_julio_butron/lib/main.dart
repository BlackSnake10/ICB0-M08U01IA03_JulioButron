import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor de un campo de Texto',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            child: Text(myController.text),
          ),
        );
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(myController.text),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(myController.text)),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(myController.text),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recuperar el valor de un campo de Texto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: myController,
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => showSimpleDialog(context),
              tooltip: 'Mostrar SimpleDialog!',
              backgroundColor: Colors.red,
              child: const Icon(Icons.format_list_numbered),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => showAlertDialog(context),
              tooltip: 'Mostrar AlertDialog!',
              backgroundColor: Colors.blue,
              child: const Icon(Icons.warning),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => showSnackBar(context),
              tooltip: 'Mostrar SnackBar!',
              backgroundColor: Colors.green,
              child: const Icon(Icons.message),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => showBottomSheet(),
              tooltip: 'Mostrar ModalBottomSheet!',
              backgroundColor: Colors.yellow,
              child: const Icon(Icons.view_agenda),
            ),
          ],
        ));
  }
}
