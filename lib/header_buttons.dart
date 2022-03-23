import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class HeaderButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final style = Mix(
    paddingHorizontal(12),
    paddingVertical(5),
    elevation(2),
    rounded(10),
    bgColor($tertiary),
    textStyle($button),
    textColor($onPrimary),
    fontSize(20),
    disabled(
      bgColor(Colors.grey),
      textColor(Colors.black54),
    ),
  );

  HeaderButton({Key? key, this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Pressable(
      onPressed: onPressed,
      mix: style,
      child: TextMix(label),
    );
  }
}