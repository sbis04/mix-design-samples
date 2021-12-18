import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get pressableMix => Mix(
      elevation(8),
      padding(20),
      rounded(30),
      bgColor(Colors.white),
      border(
        color: Colors.black,
        width: 2,
      ),
      hover(
        border(
          color: Colors.green,
        ),
      ),
      press(
        elevation(1),
        border(
          color: Colors.green,
          width: 4,
        ),
      ),
    );

class PressableSample extends StatelessWidget {
  const PressableSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: () {},
      mix: pressableMix,
      child: const TextMix('Tap here'),
    );
  }
}
