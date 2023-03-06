import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AlignPractice extends StatelessWidget {
  const AlignPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      // Factor에 따라 Align 영역이 바뀌는 것을 확인하기 위해 색 추가 위젯 사용
      body: ColoredBox(
        color: Colors.black,
        child: Align(
          alignment: const Alignment(0, 0.5),

          // 자식 위젯의 너비의 2배 만큼 늘어남
          widthFactor: 2,

          // 자식 위젯의 높이의 3개 만큼 늘어남
          heightFactor: 3,

          // Factor 갖지 않으면 항상 최대치를 갖는다.


          child: Container(
            width: 100,
            height: 100,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
