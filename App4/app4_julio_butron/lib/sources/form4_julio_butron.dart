// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';

class Form4 extends StatefulWidget {
  const Form4({Key? key}) : super(key: key);

  @override
  State<Form4> createState() => _Form4State();
}

class _Form4State extends State<Form4> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _characterTypes = ['Jedi', 'Sith', 'Droid', 'Wookiee', 'Human', 'Ewok'];
  final _lightsaberColors = [
    'Blue',
    'Green',
    'Red',
    'Purple',
    'Yellow',
    'White',
    'Black'
  ];

  InputDecoration _inputDecoration(
      {required String labelText, required IconData icon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      prefixIcon: Icon(icon, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Julio Butrón Cerpa S2AM'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Star Wars Character Form',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    FormBuilderChoiceChip(
                      name: 'character_type',
                      decoration: _inputDecoration(
                          labelText: 'Select Character Type',
                          icon: Icons.category),
                      options: _characterTypes
                          .map((type) => FormBuilderChipOption(
                                value: type,
                                child: Text(type),
                              ))
                          .toList(),
                      selectedColor: Colors.blue,
                      spacing: 10.0,
                      runSpacing: 5.0,
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'character_name',
                      decoration: _inputDecoration(
                          labelText: 'Character Name', icon: Icons.person),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDropdown(
                      name: 'lightsaber_color',
                      decoration: _inputDecoration(
                          labelText: 'Lightsaber Color',
                          icon: Icons.color_lens),
                      items: _lightsaberColors
                          .map((color) => DropdownMenuItem(
                                value: color,
                                child: Text(color),
                              ))
                          .toList(growable: false),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderSlider(
                      name: 'midi_chlorian_count',
                      min: 1.0,
                      max: 20000.0,
                      initialValue: 1.0,
                      divisions: 19999,
                      decoration: _inputDecoration(
                        labelText: 'Midi-chlorian Count',
                        icon: Icons.bubble_chart,
                      ),
                      valueTransformer: (value) => value?.round(),
                      displayValues: DisplayValues.all,
                      numberFormat: NumberFormat(),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'home_planet',
                      decoration: _inputDecoration(
                        labelText: 'Home Planet',
                        icon: Icons.public,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'species',
                      decoration: _inputDecoration(
                        labelText: 'Species',
                        icon: Icons.nature,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          print(_formKey.currentState?.value);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
