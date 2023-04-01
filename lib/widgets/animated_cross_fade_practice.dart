import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedCrossFadePractice extends StatefulWidget {
  const AnimatedCrossFadePractice({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadePractice> createState() => _AnimatedCrossFadePracticeState();
}

class _AnimatedCrossFadePracticeState extends State<AnimatedCrossFadePractice> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    final firstChild = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print('first 눌림');
      },
      child: const Text(
        '안녕하세요',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    final secondChild = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print('second 눌림');
      },
      child: const Text(
        '변했습니다',
        style: TextStyle(
          fontSize: 25,
          color: Colors.purpleAccent,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    const duration = Duration(seconds:3);
    const reverseDuration = Duration(seconds: 3);

    return DefaultScaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.purpleAccent.withOpacity(0.3),
              child: AnimatedCrossFade(
                firstChild: firstChild,
                secondChild: secondChild,

                /// [firstChild]와 [secondChild] 크기가 서로 다를 때, 더 작은 위젯이 어디서부터 날아올건지 (최종 목적지는 center) 정함
                // alignment: Alignment.topLeft,

                /// alignment가 조정되는 상황(사이즈가 다른 상황)에서 alignment의 Curve
                sizeCurve: Curves.bounceInOut,

                /// 어느 것을 보여줄 것인지 정함
                crossFadeState: !isChanged ? CrossFadeState.showFirst : CrossFadeState.showSecond,

                /// 사라지거나 나타날 때의 지속시간
                duration: duration,
                reverseDuration: reverseDuration,

                /// [FirstChild]가 나타나고 사라질 때의 Curve, 사라지는 것은 [firstCurve]를 반전으로 줍니다.
                firstCurve: Curves.easeOutCirc,
                secondCurve: Curves.linear,

                /// 애니메이션이 끝난 후 위치를 조절할 때 사용한다. 현재 보여지는 것이 top
                layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
                  return Column(
                    children: <Widget>[
                      topChild,
                      bottomChild,
                    ],
                  );
                },

              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isChanged = !isChanged;
                });
              },
              child: Text('바꾸기'),
            ),
          ],
        ),
      ),
    );
  }
}
