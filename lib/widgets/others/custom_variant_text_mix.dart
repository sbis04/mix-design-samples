import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

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
