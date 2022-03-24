import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'custom_mix.dart';

class HeaderButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? label;
  final IconMix? icon;
  final style = Mix(
    paddingHorizontal(12),
    paddingVertical(5),
    elevation(2),
    rounded(10),
    bgColor($tertiary),
    textStyle($button),
    textColor($onPrimary),
    fontSize(20),
    iconColor(Colors.white),
    dark(
      textColor(Colors.black),
      iconColor(Colors.black)
    )
  );

  HeaderButton({Key? key, this.onPressed, this.icon, this.label='Press Me'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Pressable(
      onPressed: onPressed,
      mix: style.apply(disabledMix),
      child: icon == null? TextMix(label!) : icon!,
    );
  }
}