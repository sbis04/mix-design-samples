import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get animPressableMix => Mix(
      elevation(8),
      padding(20),
      rounded(30),
      bgColor(Colors.greenAccent),
      animated(),
      scale(1),
      press(
        scale(0.9),
        elevation(1),
      ),
    );

class AnimatedPressableSample extends StatelessWidget {
  const AnimatedPressableSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: () {},
      mix: animPressableMix,
      child: const TextMix('Animated Button'),
    );
  }
}
