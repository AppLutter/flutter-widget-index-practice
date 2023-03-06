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
          // Factor 확인용
          ColoredBox(
            color: Colors.black,
            child: AnimatedAlign(
              alignment: isAligned ? Alignment.topLeft : Alignment.centerRight,

              // 애니메이션 완화 곡선, 즉 단위 간격과 단위 간격의 매핑
              // 다양한 Enum 값 사용 또는 직접 만들 수 있다.
              curve: Curves.bounceOut,

              // 애니메이션 지속시간
              duration: const Duration(seconds: 1),

              widthFactor: 2.0,
              heightFactor: 3.0,

              onEnd: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      icon: Icon(Icons.ac_unit),
                      title: Text('끝'),
                      content: Text('끝났습니다~'),
                    );
                  },
                );
              },

              child: const FlutterLogo(size: 100),
            ),
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
