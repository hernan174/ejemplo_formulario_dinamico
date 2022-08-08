import 'package:flutter/material.dart';

import 'package:ejemplo_formulario_dinamico/view/ejemplo2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario Dinamico',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario Dinamico'),
        ),
        body: const FormularioDinamico2(),
      ),
    );
  }
}
