import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/styles/app_ts.dart';

import '../common/default_scaffold.dart';

class AnimatedDefaultTextStylePractice extends StatefulWidget {
  const AnimatedDefaultTextStylePractice({Key? key}) : super(key: key);

  @override
  State<AnimatedDefaultTextStylePractice> createState() => _AnimatedDefaultTextStylePracticeState();
}

class _AnimatedDefaultTextStylePracticeState extends State<AnimatedDefaultTextStylePractice> {
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isChanged = !isChanged;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyleA = AppTs.exo14.copyWith(color: Colors.red, fontSize: 20);

    final textStyleB = AppTs.exo14.copyWith(color: Colors.blue, fontSize: 40);

    return DefaultScaffold(
      body: Center(
        child: AnimatedDefaultTextStyle(
          softWrap: true,
          duration: const Duration(seconds: 1),
          style: isChanged ? textStyleA : textStyleB,
          child: Text('이게 텍스트 입니다.'*3),
        ),
      ),
    );
  }
}
