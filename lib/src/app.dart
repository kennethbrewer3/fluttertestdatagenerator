import 'package:flutter/material.dart';
import 'package:test_data_generator/src/presentation/generator_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GeneratorPage(title: 'Flutter Demo Home Page'),
    );
  }
}