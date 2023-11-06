import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'sources/form1_julio_butron.dart';
import 'sources/form2_julio_butron.dart';
import 'sources/form3_julio_butron.dart';
import 'sources/form4_julio_butron.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', '')],
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form Builder'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Form 1'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Form1(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Form 2'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Form2(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Form 3'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Form3(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Form 4'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Form4(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
