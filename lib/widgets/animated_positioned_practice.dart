import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';
import 'package:flutter_widget_index_practice/generated/assets.dart';

class AnimatedPositionedPractice extends StatefulWidget {
  const AnimatedPositionedPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedPractice> createState() => _AnimatedPositionedPracticeState();
}

class _AnimatedPositionedPracticeState extends State<AnimatedPositionedPractice> {
  double left = 0.0;
  double top = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (size.width / 2).round();
    final height = (size.height / 2).round();
    return DefaultScaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            left = Random().nextInt(width).toDouble();
            top = Random().nextInt(height).toDouble();
          });
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              left: left,
              top: top,
              /// 자식의 사이즈를 애니메이션 효과를 주면서 변화 가능
              width: top,
              height: left,
              child: Image.asset(
                Assets.assetsFlower,
              ),
              duration: const Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
