import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get boxMix => Mix(
      height(150),
      width(150),
      rounded(20),
      elevation(8),
      bgColor(Colors.green),
    );

class BoxSample extends StatelessWidget {
  const BoxSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: boxMix,
    );
  }
}
