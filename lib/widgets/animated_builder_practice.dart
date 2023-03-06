import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedBuilderPractice extends StatefulWidget {
  const AnimatedBuilderPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderPractice> createState() => _AnimatedBuilderPracticeState();
}

class _AnimatedBuilderPracticeState extends State<AnimatedBuilderPractice> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultScaffold(
      body: Center(

        // AnimatedBuilder 는 AnimatedWidget 를 상속 받음
        child: AnimatedBuilder(

          // 위젯이 청취하는 컨트롤러를 넣으면 된다.
          // 이 값이 변화하면 builder를 호출시킴
          animation: _controller,

          // builder에 전달할 위젯.. 다시 그릴 필요가 없는 부분은
          // child 위젯에 정의하고 builder에서는 내부의 child를 받아쓰도록 하는 것이
          // 불필요한 repaint를 막아 성능최적화에 도움을 준다.
          child: Container(
            width: size.width/2,
            height: size.height/2,
            color: Colors.green,
            child: const Center(
              child: Text('Whee!'),
            ),
          ),

          // animation 변경될 때 마다 호출되는 TransitionBuilder
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _controller.value,
              // angle: _controller.value * 2.0 * pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
