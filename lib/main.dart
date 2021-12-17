import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_design_samples/custom_mix.dart';

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
          child: BasicMix(),
        ),
      ),
    );
  }
}

class BasicMix extends StatelessWidget {
  const BasicMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: mix,
    );
  }
}

class BasicTextMix extends StatelessWidget {
  BasicTextMix({Key? key}) : super(key: key);

  final style = Mix(titleCase());

  @override
  Widget build(BuildContext context) {
    return TextMix('design system', mix: style);
  }
}

class ComponentWithMix extends StatelessWidget {
  const ComponentWithMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      elevation(8),
      rounded(20),
      bgColor(Colors.purple),
      borderWidth(5),
      borderColor(Colors.deepPurple),
      padding(20),
      font(
        color: Colors.white,
        size: 20,
      ),
    );
    return Box(
      mix: style,
      child: const TextMix(
        'Welcome to MIX',
      ),
    );
  }
}

class ComponentWithoutMix extends StatelessWidget {
  const ComponentWithoutMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.deepPurple,
            width: 5,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Welcome to MIX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
