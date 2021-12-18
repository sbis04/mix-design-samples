import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get dynamicMix => Mix(
      height(150),
      width(150),
      rounded(20),
      elevation(8),
      bgColor(Colors.green),
      border(
        color: Colors.green.shade800,
        width: 8,
      ),
      dark(
        bgColor(Colors.grey),
        border(
          color: Colors.white,
        ),
      ),
    );

class DynamicBoxSample extends StatelessWidget {
  const DynamicBoxSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: dynamicMix,
    );
  }
}
