import 'package:flutter/material.dart';
import 'package:mix_design_samples/sample_code.dart';
import 'package:mix/mix.dart';
import 'package:mix_design_samples/widgets/dynamic/dynamic_mix.dart';

import 'widgets/animated/animated_pressable_sample.dart';
import 'widgets/basics/design_tokens_sample.dart';
import 'widgets/basics/basic_mix.dart';
import 'widgets/basics/box_sample.dart';
import 'widgets/basics/flex_box_sample.dart';
import 'widgets/basics/icon_mix_sample.dart';
import 'widgets/basics/pressable_sample.dart';
import 'widgets/basics/text_mix_sample.dart';

void main() {
  runApp(const MyApp());
}

typedef SampleSelectorFunc = void Function(String sampleName);

class SampleSelector extends StatelessWidget {
  final SampleSelectorFunc fn;
  const SampleSelector(this.fn, {Key? key}) : super(key: key);
  Widget mkListTile(BuildContext context, String title) => Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.white38, width: 1.0))),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
              hoverColor: Theme.of(context).primaryColor,
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
                mkListTile(context, TEXTMIX_SAMPLE),
                mkListTile(context, DESIGN_TOKENS_SAMPLE),
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
      case TEXTMIX_SAMPLE:
        return const TextMixSample();
      case DESIGN_TOKENS_SAMPLE:
        return const DesignTokensSample();
    }

    return Container();
  }

  Widget createCodeWidget() {
    String snippet = const SampleCode().fetchCode(_sampleName);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        border: Border.all(color: Colors.black26, width: 1.0)
      ),
      height: double.infinity,
      child: EditableText(
        readOnly: true,
        backgroundCursorColor: Colors.transparent,
        cursorColor: Colors.black,
        focusNode: FocusNode(canRequestFocus: true),
        style: const TextStyle(fontSize: 16.0, color: Colors.black,),
        controller: TextEditingController(text: snippet),
        selectionColor: Colors.black26,
      ),
    );
  }

  void setSampleName(String val) {
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
    return MaterialApp(
      title: 'MIX Samples',
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.orange,
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 70.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                boxShadow: [
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
                          style: const TextStyle(color: Colors.white, fontSize: 25.0)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        onPressed: () { setShowCode(!_showCode); },
                        child: const Text("Code"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: _showCode? 
                   createCodeWidget() :
                   createSample(),
          ),
          bottomNavigationBar: Container(
            constraints: const BoxConstraints(maxHeight: 40.0),
            color: Colors.black,
            alignment: Alignment.center,
            child: Builder(
                builder: (BuildContext context) => TextButton(
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(
                          (buildContext) => SampleSelector(setSampleName));
                    },
                    child: const Text("Choose Sample",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)))),
          ),
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


