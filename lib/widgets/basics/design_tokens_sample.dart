import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get basicMix => Mix(
      height(150),
      width(150),
      rounded(20),
      elevation(8),
      bgColor($primary),
    );

class DesignTokensSample extends StatelessWidget {
  const DesignTokensSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: basicMix,
    );
  }
}
