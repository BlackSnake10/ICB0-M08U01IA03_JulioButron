// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Form3 extends StatefulWidget {
  const Form3({Key? key}) : super(key: key);
  @override
  State<Form3> createState() => _Form3State();
}

class _Form3State extends State<Form3> {
  final _formKey = GlobalKey<FormBuilderState>();

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
        title: const Text('Form 3'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Julio Butrón Cerpa S2AM',
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
                      name: 'position',
                      decoration: _inputDecoration(
                          labelText: 'Select Position',
                          icon: Icons.sports_soccer),
                      options: const [
                        FormBuilderChipOption(
                          value: 'Goalkeeper',
                          child: Text('Goalkeeper'),
                        ),
                        FormBuilderChipOption(
                          value: 'Defender',
                          child: Text('Defender'),
                        ),
                        FormBuilderChipOption(
                          value: 'Midfielder',
                          child: Text('Midfielder'),
                        ),
                        FormBuilderChipOption(
                          value: 'Forward',
                          child: Text('Forward'),
                        ),
                      ],
                      selectedColor: Colors.blue,
                      spacing: 10.0,
                      runSpacing: 5.0,
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'player_name',
                      decoration: _inputDecoration(
                          labelText: 'Player Name', icon: Icons.person),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDropdown(
                      name: 'foot',
                      decoration: _inputDecoration(
                          labelText: 'Preferred Foot',
                          icon: Icons.directions_run),
                      items: ['Left', 'Right']
                          .map((foot) => DropdownMenuItem(
                                value: foot,
                                child: Text(foot),
                              ))
                          .toList(growable: false),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderRadioGroup(
                      name: 'captain',
                      decoration: _inputDecoration(
                          labelText: 'Is the player a captain?',
                          icon: Icons.star),
                      options: const [
                        FormBuilderFieldOption(
                            value: 'Yes', child: Text('Yes')),
                        FormBuilderFieldOption(value: 'No', child: Text('No')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDateTimePicker(
                      name: 'birthdate',
                      inputType: InputType.date,
                      decoration: _inputDecoration(
                          labelText: 'Birthdate', icon: Icons.calendar_today),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderSwitch(
                      name: 'injured',
                      title: const Text('Is the player currently injured?',
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                      decoration: _inputDecoration(
                          labelText: 'Injured', icon: Icons.local_hospital),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderSlider(
                        name: 'number',
                        min: 1,
                        max: 25,
                        initialValue: 1,
                        divisions: 24,
                        decoration: _inputDecoration(
                            labelText: 'Jersey Number',
                            icon: Icons.format_list_numbered),
                        valueTransformer: (value) => value?.round(),
                        displayValues: DisplayValues.all),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print(_formKey.currentState?.value);
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
