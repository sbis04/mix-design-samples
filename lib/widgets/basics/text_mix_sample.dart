import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get textMix => Mix(
      font(
        color: Colors.green,
        size: 24,
      ),
    );

class TextMixSample extends StatelessWidget {
  const TextMixSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextMix(
      'Welcome to Mix',
      mix: textMix,
    );
  }
}
