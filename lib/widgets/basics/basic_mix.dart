import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'box_sample.dart';

class BasicMix extends StatelessWidget {
  const BasicMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: boxMix,
    );
  }
}
