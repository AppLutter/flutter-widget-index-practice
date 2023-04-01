import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedOpacityPractice extends StatefulWidget {
  const AnimatedOpacityPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityPractice> createState() => _AnimatedOpacityPracticeState();
}

class _AnimatedOpacityPracticeState extends State<AnimatedOpacityPractice> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              setState(() {
                isOpacity = !isOpacity;
              });
            },
            child: Text('투명도 전환하기'),
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: isOpacity ? 0.0 : 1.0,
            child: Text('사라질 텍스트 입니다'),
          ),
        ],
      ),
    ));
  }
}
