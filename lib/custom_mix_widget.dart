import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class CustomMixWidget extends StatelessWidget {
  const CustomMixWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      height(100),
      animated(),
      padding(10),
      elevation(8),
      rounded(10),
      bgColor($primary),
      textStyle($button),
      textColor($onPrimary),
      hover(
        elevation(2),
        padding(20),
        bgColor($secondary),
        textColor($onSecondary),
      ),
    );
    return Pressable(
      onPressed: () {},
      mix: style,
      child: const TextMix('Custom Widget'),
    );
  }
}
