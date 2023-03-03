import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/default_scaffold.dart';

class AlertDialogPractice extends StatefulWidget {
  const AlertDialogPractice({Key? key}) : super(key: key);

  @override
  State<AlertDialogPractice> createState() => _AlertDialogPracticeState();
}

class _AlertDialogPracticeState extends State<AlertDialogPractice> {
  late Faker faker;

  @override
  void initState() {
    super.initState();
    faker = Faker();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  barrierColor: Colors.black12,
                  context: context,
                  useRootNavigator: false,
                  builder: (_) => AlertDialog(
                    // actions는 TextButton List라고 보면 된다.
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('확인'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('확인'),
                      ),
                    ],
                    // actions는 기본 alignment가 end
                    actionsAlignment: MainAxisAlignment.center,

                    // actions에 들어간 위젯이 일정 너비를 차지하면 Overflow 상태가 되는데,
                    // 이를 방지하기 위하여서 버튼이 세로로 정렬 된다.
                    // 세로로 정렬된 버튼열의 가로 위치를 결정한다
                    // Row 위젯에 children으로 Column 위젯이 하나 있는데 이 위치를 결정하기 위하여서
                    // mainAxisAlignment 속성을 사용하는 것과 같음
                    actionsOverflowAlignment: OverflowBarAlignment.center,

                    // actions들이 overflow 되어서 세로 정렬로 바뀌었을 때
                    // 각 위젯간 수직 간격을 정하는 프로퍼티이다
                    actionsOverflowButtonSpacing: 0,

                    // actions 영역에 padding 값 주기
                    actionsPadding: const EdgeInsets.all(50.0),

                    // actions에 들어가는 위젯에 기본적으로 주는 padding 값
                    // 기본값은 symmetric(horizontal:8.0)이다.
                    buttonPadding: const EdgeInsets.symmetric(horizontal: 5.0),

                    // 다이얼로그 상자 자체가 어느 위치에 뜰 건지 정한다.
                    // null 값이면 DialogTheme.alignment가 사용 되는데
                    // 그 값도 null이면 Alignment.center를 사용한다.
                    alignment: Alignment.topLeft,

                    // title이나 content내용이 overflow가 예상될 경우에 사용한다.
                    // title과 content가 하나의 ListView에 담긴 것처럼 된다.
                    // actions는 가리지 않는다 따로임
                    scrollable: true,
                    content: Text(faker.lorem.sentences(5).toString()),
                    contentTextStyle: const TextStyle(fontWeight: FontWeight.w700),

                    // title 위에 아이콘 보여주고 싶을 때 사용
                    icon: const Icon(Icons.alternate_email_rounded),
                    iconColor: Colors.pink,

                    // 기본 값은 fromLTRB(20, 20, 20, 0)
                    // title이 존재하면 fromLTRB(20, 20, 20, 16)
                    // title은 null이고 content는 null이 아니면 기본 값 적용

                    iconPadding: const EdgeInsets.only(top: 5.0),

                    // 화면을 기준으로 다이얼로그에 패딩을 줌
                    // left만 10주면 화면에서 약간 더 오른쪽으로 위치됨
                    // 당연히 더 이상 갈 공간이 없으면 찌그러듬
                    insetPadding: EdgeInsets.zero,

                    elevation: 1.0,

                    // 그림자 색상
                    shadowColor: Colors.yellow,

                    // ShpaeBorder를 상속 받는 클래스는 다 가능

                    // BoxBorder : Border, BorderDirectional
                    // InputBorder : UnderlineInputBorder, OutlineInputBorder, InputDecoration
                    // OutlinedBorder : BeveledRectangleBorder, CircleBorder, ContinuousRectangleBorder,
                    //                  MaterialStateOutlinedBorder, RoundedRectangleBorder(이 친구가 ContinuousRectangleBorder보다 더 둥그렇게 깎임)
                    //                  StadiumBorder (긴 원통), StarBorder
                    //
                    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular()),
                    // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(35)),
                    shape: const StarBorder(),

                    // shape를 변형 주었을 때 내부 위젯이 투명한 공간을 떠 있는 것 처럼 보이는 경우가 있다.
                    // 예를 들어서 StarBorder를 주면 별 꼭지점 사이에는 삼각형같은 빈 공간이 생기는데
                    // 그 공간에 있는 content, title, action 다 상관없이 보여줄건지 잘라낼 건지 결정할 수 있다.
                    // 기본 값은 Clip.none이라서 잘라내기 않는다.
                    clipBehavior: Clip.hardEdge,

                    // elevation에 따른 반사되어서 고도를 반영하는 배경색
                    // elevation이 작을수록 색이 연해진다.
                    // backgroundColor를 쓰면 체감하기 어렵다.
                    // material3에서만 사용 가능하다.
                    surfaceTintColor: Colors.purple,

                    // backgroundColor: Colors.yellow,
                  ),
                );
              },
              child: const Text('Show Alert Dialog!'),
            ),
          ],
        ),
      ),
    );
  }
}
