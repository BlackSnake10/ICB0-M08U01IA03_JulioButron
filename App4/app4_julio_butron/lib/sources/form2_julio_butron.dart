// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Form2 extends StatefulWidget {
  const Form2({Key? key}) : super(key: key);

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

  InputDecoration _inputDecoration(
      {required String labelText, required IconData icon}) {
    return InputDecoration(
      labelText: labelText,
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
      appBar: AppBar(title: const Text('Form 2')),
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
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep <= 2) {
                    setState(() => _currentStep += 1);
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() => _currentStep -= 1);
                  }
                },
                controlsBuilder: (context, details) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          if (_currentStep > 0)
                            TextButton(
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                            ),
                          const Spacer(),
                          if (_currentStep < 2)
                            ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: const Text('Next'),
                            ),
                          if (_currentStep == 2)
                            ElevatedButton(
                              onPressed: () {
                                print(_formKey.currentState?.value);
                                Navigator.pop(context);
                              },
                              child: const Text('Upload'),
                            ),
                        ],
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                    title: const Text('Personal'),
                    content: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'name',
                          decoration: _inputDecoration(
                            labelText: 'Name',
                            icon: Icons.person,
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'surname',
                          decoration: _inputDecoration(
                            labelText: 'Surname',
                            icon: Icons.person,
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'username',
                          decoration: _inputDecoration(
                            labelText: 'Username',
                            icon: Icons.person,
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'dni',
                          decoration: _inputDecoration(
                            labelText: 'DNI',
                            icon: Icons.credit_card,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(9),
                          ]),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep > 0
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Contact'),
                    content: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
                          decoration: _inputDecoration(
                            labelText: 'Email',
                            icon: Icons.email,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'address',
                          decoration: _inputDecoration(
                            labelText: 'Address',
                            icon: Icons.home,
                          ),
                          validator: FormBuilderValidators.required(),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: _inputDecoration(
                            labelText: 'Phone Number',
                            icon: Icons.phone,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(9),
                          ]),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep > 1
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Submit'),
                    content: Column(
                      children: [
                        const Text(
                          'Form Data:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Name: ${_formKey.currentState?.fields['name']?.value}"),
                        Text(
                            "Surname: ${_formKey.currentState?.fields['surname']?.value}"),
                        Text(
                            "DNI: ${_formKey.currentState?.fields['dni']?.value}"),
                        Text(
                            "Email: ${_formKey.currentState?.fields['email']?.value}"),
                        Text(
                            "Address: ${_formKey.currentState?.fields['address']?.value}"),
                        Text(
                            "Phone: ${_formKey.currentState?.fields['phone']?.value}"),
                      ],
                    ),
                    isActive: _currentStep >= 2,
                    state: _currentStep == 2
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
