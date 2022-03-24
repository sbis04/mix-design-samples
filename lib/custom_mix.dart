import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get customVarient => Mix();

Mix get disabledMix => Mix(
  disabled(
    bgColor(Colors.grey),
    textColor(Colors.black54),
  )
);
