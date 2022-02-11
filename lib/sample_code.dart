const String
  BASIC_MIX = "Basic Mix",
  BOX_SAMPLE = "Box Sample",
  FLEXBOX_SAMPLE = "Flexbox Sample",
  ICONMIX_SAMPLE = "IconMix Sample",
  PRESSABLE_SAMPLE = "Pressable Sample",
  ANIMATED_PRESSABLE_SAMPLE = "Animated Pressable Sample",
  TEXTMIX_SAMPLE = "TextMix Sample",
  DESIGN_TOKENS_SAMPLE = "Design Tokens Sample",
  DYNAMIC_SAMPLE = "Dynamic Sample";

class SampleCode {
  const SampleCode();
  static const Map<String, String> _snippets = {
    BASIC_MIX: 
'''
class BasicMix extends StatelessWidget {
  const BasicMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: boxMix,
    );
  }
}
''',
    BOX_SAMPLE:
'''
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
''',
  FLEXBOX_SAMPLE:
'''
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
''',
  ICONMIX_SAMPLE:
'''
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
''',
  PRESSABLE_SAMPLE:
'''
  Mix get pressableMix => Mix(
        elevation(8),
        padding(20),
        rounded(30),
        bgColor(Colors.white),
        border(
          color: Colors.black,
          width: 2,
        ),
        hover(
          border(
            color: Colors.green,
          ),
        ),
        press(
          elevation(1),
          border(
            color: Colors.green,
            width: 4,
          ),
        ),
      );

  class PressableSample extends StatelessWidget {
    const PressableSample({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Pressable(
        onPressed: () {},
        mix: pressableMix,
        child: const TextMix('Tap here'),
      );
    }
  }
''',
  ANIMATED_PRESSABLE_SAMPLE:
'''
Mix get animPressableMix => Mix(
      elevation(8),
      padding(20),
      rounded(30),
      bgColor(Colors.greenAccent),
      animated(),
      scale(1),
      press(
        scale(0.9),
        elevation(1),
      ),
    );

class AnimatedPressableSample extends StatelessWidget {
  const AnimatedPressableSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: () {},
      mix: animPressableMix,
      child: const TextMix('Animated Button'),
    );
  }
}
''',
  TEXTMIX_SAMPLE:
'''
Mix get textMix => Mix(
      font(
        color: Colors.green,
        size: 24,
      ),
    );

class TextMixSample extends StatelessWidget {
  const TextMixSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextMix(
      'Welcome to Mix',
      mix: textMix,
    );
  }
}
''',
  DESIGN_TOKENS_SAMPLE:
'''
Mix get basicMix => Mix(
      height(150),
      width(150),
      rounded(20),
      elevation(8),
      bgColor(\$primary),
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
''',
  DYNAMIC_SAMPLE:
'''
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
'''
};

  String fetchCode(String sampleName) =>
     _snippets.containsKey(sampleName)?
      _snippets[sampleName]! :
      "No Code for $sampleName";
}