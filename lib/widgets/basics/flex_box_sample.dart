import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get flexBoxMix => Mix(
      gap(16),
      mainAxis(MainAxisAlignment.center),
      font(
        size: 26,
        color: Colors.blue,
      ),
    );

class FlexBoxSample extends StatelessWidget {
  const FlexBoxSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexBox(
      mix: flexBoxMix,
      direction: Axis.vertical,
      children: const [
        TextMix('Item 1'),
        TextMix('Item 2'),
        TextMix('Item 3'),
      ],
    );
  }
}
