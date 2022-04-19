import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get inbuiltVariantMix => Mix(
      rounded(35),
      elevation(8),
      width(100),
      height(50),
      align(Alignment.center),
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
      child: const TextMix("Press Me"),
    );
  }
}
