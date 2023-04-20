import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

import '../generated/assets.dart';

class AnimatedPhysicalModelPractice extends StatefulWidget {
  const AnimatedPhysicalModelPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedPhysicalModelPractice> createState() => _AnimatedPhysicalModelPracticeState();
}

class _AnimatedPhysicalModelPracticeState extends State<AnimatedPhysicalModelPractice> {
  double elevation = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            elevation = (elevation + 10) % 20;
          });
        },
        child: Center(
          ///
          child: AnimatedPhysicalModel(
            // shape: BoxShape.circle,
            shape: BoxShape.rectangle,
            elevation: elevation,
            color: elevation == 0 ? Colors.red : Colors.green,
            shadowColor: Colors.blue,

            /// 색 변화에 애니메이션 줄 건지 여부
            animateColor: true,
            animateShadowColor: true,

            ///
            borderRadius: BorderRadius.circular(20),
            curve: Curves.bounceOut,
            duration: const Duration(seconds: 2),
            child: Image.asset(
              Assets.assetsFlower,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
