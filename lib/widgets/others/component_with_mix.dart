import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

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
