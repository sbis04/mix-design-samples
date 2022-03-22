import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mix/mix.dart';
import 'package:mix_design_samples/sample_code.dart';
import 'package:mix_design_samples/widgets/dynamic/dynamic_mix.dart';

import 'widgets/animated/animated_pressable_sample.dart';
import 'widgets/basics/design_tokens_sample.dart';
import 'widgets/basics/basic_mix.dart';
import 'widgets/basics/box_sample.dart';
import 'widgets/basics/flex_box_sample.dart';
import 'widgets/basics/icon_mix_sample.dart';
import 'widgets/basics/pressable_sample.dart';
import 'widgets/basics/text_mix_sample.dart';

import 'widgets/others/custom_variant_text_mix.dart';
import 'widgets/others/inbuilt_variant_mix.dart';

void main() {
  runApp(const MyApp());
}

typedef SampleSelectorFunc = void Function(String sampleName);

class SampleSelector extends StatelessWidget {
  final SampleSelectorFunc fn;
  const SampleSelector(this.fn, {Key? key}) : super(key: key);
  Widget mkListTile(BuildContext context, String title,
          [bool separate = false]) =>
      Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: separate
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white38,
                    width: separate ? 2.0 : 1.0))),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
              hoverColor: Theme.of(context).colorScheme.primary,
              dense: true,
              title: Text(title,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center),
              onTap: () {
                Navigator.pop(context);
                fn(title);
              }),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            border:
                Border(bottom: BorderSide(width: 2.0, color: Colors.white))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                mkListTile(context, BASIC_MIX),
                mkListTile(context, BOX_SAMPLE),
                mkListTile(context, FLEXBOX_SAMPLE),
                mkListTile(context, ICONMIX_SAMPLE),
                mkListTile(context, PRESSABLE_SAMPLE),
                mkListTile(context, ANIMATED_PRESSABLE_SAMPLE),
                mkListTile(context, TEXTMIX_SAMPLE),
                mkListTile(context, DESIGN_TOKENS_SAMPLE, true),
                mkListTile(context, DYNAMIC_SAMPLE, true),
                mkListTile(context, CUSTOM_VARIANT_TEXTMIX_SAMPLE),
                mkListTile(context, INBUILT_VARIANT_MIX_SAMPLE)
              ],
            ),
          ],
        ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _sampleName = BASIC_MIX;
  bool _showCode = false;
  bool _isDarkMode = false;
  bool _allowDarkMode = false;
  PersistentBottomSheetController? _bsCtlr;
  Timer? _bsTimer;

  Future<void> closeBSCtlr() async {
    if (_bsTimer != null && _bsTimer!.isActive) {
      _bsTimer!.cancel();
    }
    if (_bsCtlr != null) {
      _bsCtlr!.close();
    }
    setState(() {
      _bsTimer = null;
    });
  }

  Widget createSample() {
    switch (_sampleName) {
      case BASIC_MIX:
        return const BasicMix();
      case BOX_SAMPLE:
        return const BoxSample();
      case FLEXBOX_SAMPLE:
        return const FlexBoxSample();
      case ICONMIX_SAMPLE:
        return const IconMixSample();
      case PRESSABLE_SAMPLE:
        return const PressableSample();
      case ANIMATED_PRESSABLE_SAMPLE:
        return const AnimatedPressableSample();
      case TEXTMIX_SAMPLE:
        return const TextMixSample();
      case DESIGN_TOKENS_SAMPLE:
        return const DesignTokensSample();
      case DYNAMIC_SAMPLE:
        _allowDarkMode = true;
        return const DynamicBoxSample();
      case CUSTOM_VARIANT_TEXTMIX_SAMPLE:
        return const VariantTextMix();
      case INBUILT_VARIANT_MIX_SAMPLE:
        return const VariantMix();
    }

    return Container();
  }

  Widget createCodeWidget() {
    String snippet = const SampleCode().fetchCode(_sampleName);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.orange[100],
          border: Border.all(color: Colors.black26, width: 1.0)),
      height: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: TextField(
          keyboardType: TextInputType.multiline,
          decoration: null,
          minLines: 2,
          maxLines: 1000,
          readOnly: true,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          controller: TextEditingController(text: snippet),
        ),
      ),
    );
  }

  void setSampleName(String val) {
    closeBSCtlr();
    setState(() {
      _sampleName = val;
      _showCode = false;
    });
  }

  void setShowCode(bool flag) {
    setState(() => _showCode = flag);
  }

  @override
  Widget build(BuildContext context) {
    _allowDarkMode = false;

    return MaterialApp(
      title: 'MIX Samples',
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.blue,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.orange)),
      ),
      darkTheme: ThemeData(
          colorScheme: ThemeData.dark().colorScheme.copyWith(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.black87))),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: closeBSCtlr,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 70.0),
              child: Builder(builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 8.0,
                          spreadRadius: 4.0)
                    ],
                  ),
                  height: 100.0,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          child: Text(_sampleName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (_allowDarkMode)
                              ElevatedButton(
                                  onPressed: _bsTimer == null? () {
                                    setState(() {
                                      _isDarkMode = !_isDarkMode;
                                    });
                                  } : null,
                                  child: Icon(Icons.dark_mode,
                                      color: _isDarkMode
                                          ? Colors.white
                                          : Colors.black)),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: _bsTimer == null? 
                                () { setShowCode(!_showCode); } : null,
                              child: const Text("Code"),
                            ),
                            const SizedBox(width: 20)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            body: Center(
              child: _showCode ? createCodeWidget() : createSample(),
            ),
            bottomNavigationBar: SizedBox(
              width: double.infinity,
              height: 40.0,
              child: Box(
                mix: Mix(
                  bgColor(Colors.black),
                  align(Alignment.center),
                ),
                /*
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
              */
                child: Builder(
                  builder: (BuildContext context) => Pressable(
                    mix:Mix(
                      animated(),
                      hover(
                        scale(1.2),
                        textColor(Colors.yellow),
                      )
                    ),
                    onPressed: () async {
                      if (_bsTimer == null) {
                        setState(() {
                          _bsTimer = Timer(const Duration(seconds: 10), () async {
                            await closeBSCtlr();
                          });
                        });
                        _bsCtlr = Scaffold.of(context).showBottomSheet(
                          (buildContext) => SampleSelector(setSampleName)
                        );
                      }
                      else {
                        await closeBSCtlr();
                      }
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: TextMix(
                        "Choose Sample",
                        mix: Mix(
                          textColor(Colors.white),
                          fontSize(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
