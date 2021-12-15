import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIX Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ComponentWithoutMix(),
      ),
    );
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
    return Pressable(
      onPressed: () {},
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
