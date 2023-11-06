import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Hello World")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: const Text("Rojo"),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Text("Azul"),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text("Verde"),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Julio Butron"),
                      Text("2023-2024"),
                    ],
                  ),
                ),
              )
            ],
          ))));
}
