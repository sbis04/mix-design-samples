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
    return MaterialApp(
      title: 'MIX Samples',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: VariantTextMix(),
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

const myStyle = Var('myStyle');

Mix get style => Mix(
      titleCase(),
      myStyle(
        font(
          color: Colors.red,
          size: 24.0,
        ),
      ),
    );

class VariantTextMix extends StatelessWidget {
  const VariantTextMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextMix(
          'design system',
          mix: style,
        ),
        TextMix(
          'design system',
          mix: style,
          variant: myStyle,
        ),
      ],
    );
  }
}

Mix get inbuiltVariantMix => Mix(
      rounded(35),
      elevation(8),
      width(100),
      height(50),
      bgColor(Colors.redAccent),
      border(
        color: Colors.redAccent,
        width: 3,
      ),
      hover(
        border(color: Colors.greenAccent),
      ),
      press(
        bgColor(Colors.greenAccent),
        border(color: Colors.redAccent),
        elevation(1),
      ),
    );

class VariantMix extends StatelessWidget {
  const VariantMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pressable(
      mix: inbuiltVariantMix,
      onPressed: () {},
      child: const Box(),
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
