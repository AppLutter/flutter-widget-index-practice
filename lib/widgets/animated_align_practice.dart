import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedAlignPractice extends StatefulWidget {
  const AnimatedAlignPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignPractice> createState() => _AnimatedAlignPracticeState();
}

class _AnimatedAlignPracticeState extends State<AnimatedAlignPractice> {
  bool isAligned = false;

  void changeAlign() {
    setState(() {
      isAligned = !isAligned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: isAligned ? Alignment.topLeft : Alignment.centerRight,
            duration: const Duration(seconds: 1),
            child: const FlutterLogo(size: 100),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                onPressed: changeAlign,
                child: const Text('changeAlign'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
