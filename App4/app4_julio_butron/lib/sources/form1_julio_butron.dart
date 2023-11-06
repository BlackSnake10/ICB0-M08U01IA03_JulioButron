import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Form1 extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  Form1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Julio Butrón Cerpa S2AM',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Description',
                style: TextStyle(fontSize: 16.0),
              ),
              FormBuilderRadioGroup(
                name: 'radio_question',
                orientation: OptionsOrientation.vertical,
                options: const [
                  FormBuilderFieldOption(value: 'Option 1'),
                  FormBuilderFieldOption(value: 'Option 2'),
                  FormBuilderFieldOption(value: 'Option 3'),
                ],
                decoration: const InputDecoration(labelText: 'Radio Question'),
              ),
              FormBuilderTextField(
                name: 'remarks',
                decoration: const InputDecoration(labelText: 'Remarks'),
              ),
              FormBuilderDropdown(
                name: 'combo_question',
                decoration: const InputDecoration(labelText: 'Combo Question'),
                items: ['Option A', 'Option B', 'Option C']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
              ),
              FormBuilderCheckboxGroup(
                name: 'checkbox_question',
                orientation: OptionsOrientation.vertical,
                options: const [
                  FormBuilderFieldOption(value: 'Option 1'),
                  FormBuilderFieldOption(value: 'Option 2'),
                  FormBuilderFieldOption(value: 'Option 3'),
                  FormBuilderFieldOption(value: 'Option 4'),
                ],
                decoration:
                    const InputDecoration(labelText: 'Checkbox Question'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {}
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
