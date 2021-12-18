import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get iconMix => Mix(
      icon(
        color: Colors.blue,
        size: 50,
      ),
    );

class IconMixSample extends StatelessWidget {
  const IconMixSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconMix(
      mix: iconMix,
      icon: Icons.desktop_mac_outlined,
    );
  }
}
