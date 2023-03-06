import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedBuilderPractice2 extends StatefulWidget {
  const AnimatedBuilderPractice2({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderPractice2> createState() => _AnimatedBuilderPractice2State();
}

class _AnimatedBuilderPractice2State extends State<AnimatedBuilderPractice2> with TickerProviderStateMixin {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultScaffold(
      body: SizedBox.expand(
        // AnimatedBuilder 는 AnimatedWidget 를 상속 받음
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              // Listenable의 하위 유형(ChangeNotifier, ValueNotifier)도 가능하다.
              animation: _valueNotifier,

              // animation 변경될 때 마다 호출되는 TransitionBuilder
              builder: (BuildContext context, Widget? child) {
                return Text(
                  _valueNotifier.value.toString(),
                  style: const TextStyle(fontSize: 50.0),
                );
              },
            ),
            TextButton(
              onPressed: () {
                _valueNotifier.value += 1;
              },
              child: const Text(
                '1더하기',
                style: TextStyle(fontSize: 25.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
