import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedCrossFadePractice2 extends StatefulWidget {
  const AnimatedCrossFadePractice2({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadePractice2> createState() => _AnimatedCrossFadePractice2State();
}

class _AnimatedCrossFadePractice2State extends State<AnimatedCrossFadePractice2> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      fillColor: Colors.blueAccent.withOpacity(0.3),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
    final firstChild = TextField(
      decoration: inputDecoration,
    );
    final secondChild = TextField(
      decoration: inputDecoration,
    );

    const duration = Duration(seconds: 5);
    const reverseDuration = Duration(seconds: 5);

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

                /// TextField를 쓸 때 현재 보여지는 위젯에 포커스를 주고(키보드가 올라오게 됨)
                /// Fade를 전환하면, 키보드가 계속 올라와있고 입력이 가능해진다.. 여기서는 현재 안보이는 TextField에 계속 포커스가 남아있어서 그렇다
                /// 사라졌을 때(top에서 bottom으로 전환) 포커스도 사라지게 하려면 [excludeBottomFocus]를 true를 주면된다. (기본 값이 true라 명시 안해도 됨)
                /// 포토캐논 겹치기처럼 안보이는 상태에서도 포커스를 유지하려면 false를 주면 된다.
                excludeBottomFocus: true,
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
