import 'package:flutter/material.dart';

import 'widgets/basics/pressable_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MIX Samples',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: PressableSample(),
        ),
      ),
    );
  }
}
