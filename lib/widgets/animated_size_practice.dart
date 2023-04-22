import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedSizePractice extends StatefulWidget {
  const AnimatedSizePractice({Key? key}) : super(key: key);

  @override
  State<AnimatedSizePractice> createState() => _AnimatedSizePracticeState();
}

class _AnimatedSizePracticeState extends State<AnimatedSizePractice> {
  bool isSizeChanged = false;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            isSizeChanged = !isSizeChanged;
          });
        },
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          reverseDuration: const Duration(seconds: 1),
          alignment: Alignment.topLeft,
          child: Container(
            width: isSizeChanged ? 100 : 200,
            height: isSizeChanged ? 100 : 200,
            color: Colors.green,
            child: AnimatedSize(
              duration: const Duration(seconds: 1),
              reverseDuration: const Duration(seconds: 1),
            ),
          ),
        ),
      ),
    );
  }
}
