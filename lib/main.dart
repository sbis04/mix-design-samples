import 'package:flutter/material.dart';
import 'package:mix_design_samples/widgets/dynamic/dynamic_mix.dart';

import 'widgets/animated/animated_pressable_sample.dart';
import 'widgets/basics/design_tokens_sample.dart';
import 'widgets/basics/pressable_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIX Samples',
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.orange,
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: DesignTokensSample(),
        ),
      ),
    );
  }
}

bool isDarkMode = false;

class DynamicApp extends StatefulWidget {
  const DynamicApp({Key? key}) : super(key: key);

  @override
  State<DynamicApp> createState() => _DynamicAppState();
}

class _DynamicAppState extends State<DynamicApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIX Dynamic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: Stack(
          children: [
            const Center(
              child: DynamicBoxSample(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
                icon: const Icon(Icons.dark_mode),
              ),
            )
          ],
        ),
      ),
    );
  }
}
