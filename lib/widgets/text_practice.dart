import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class TextPractice extends StatefulWidget {
  const TextPractice({Key? key}) : super(key: key);

  @override
  State<TextPractice> createState() => _TextPracticeState();
}

class _TextPracticeState extends State<TextPractice> {
  Faker faker = Faker();
  late String sentences;

  @override
  void initState() {
    super.initState();
    sentences = faker.lorem.sentences(3).join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.green,
          child: Text(
            // 화면에 표시할 텍스트
            '12315415$sentences 123abc123 1/3',
            // 앱에서 설정한 locale 중에 하나로 변경할 때 사용
            // 즉, localization이 되어있는 문자가 아니라면 작동하지 않음
            // Localizations.localeOf(context)를 통해 기기 locale을 자동 참조하기 때문에 이 설정을 쓸 일은 거의 없음
            locale: Locale('ru'),

            // 최대 줄 수
            // 넘치면 overflow 규칙에 따라 처리됨
            // maxLines: 3,

            // 텍스트가 overflow 시에 어떻게 처리할 지 설정
            // TextOverflow enum 값에서 고를 수 있음.
            // TextStyle 내부의 overflow 보다 우위
            overflow: TextOverflow.fade,

            // TODO : 잘 모르겠음.. 복사하기 위해서 선택한 경우 색깔 같은데 확인 못함
            selectionColor: Colors.red,

            // 시맨틱에 어떻게 표시되는지 설정
            semanticsLabel: 'custom Text',

            // 텍스트가 영역(가로 길이)을 넘어갈 경우 줄바꿈 여부, null인 경우 true이다.
            softWrap: true,

            //
            style: TextStyle(
              // 배경 페인트.. backgroundColor와 동시 정의 불가
              // background: Paint()
              //   ..color = Colors.blue.withOpacity(0.3)
              //   ..style = PaintingStyle.fill,

              // 배경 색상.. background와 동시 정의 불가
              // backgroundColor: Colors.green

              // 앞면 색상 .. color랑 동시 정의 불가
              // foreground: Paint()..color=Colors.green,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                  Offset(0, 20),
                  Offset(230, 20),
                  [
                    Colors.green,
                    Colors.red,
                  ],
                ),

              // 글자 색상 .. foreground랑 동시 정의 불가
              // color: Colors.red,

              // 디버그 상태에서 인식할 때 도움주는 라벨.. TODO
              debugLabel: '디버그 라벨 입니다.',

              // 글자에 선 긋는거 정의
              decoration: TextDecoration.combine(
                [
                  TextDecoration.underline,
                  // TextDecoration.lineThrough,
                  // TextDecoration.underline,
                ],
              ),

              // 글자 선 색상 설정
              decorationColor: Colors.green,

              // 선의 모양 설정
              decorationStyle: TextDecorationStyle.dashed,

              // 선 두께 설정
              decorationThickness: 5.0,

              // yaml에 설정한 폰트 중 하나 넣기
              // fontFamily:

              // fontFamily를 찾을 수 없을 때 리스트에서 순서대로 fontFamily 호출.. 만약 다 안되면 기본 글꼴
              // fontFamilyFallback: ['NotoSansKR'],

              // 이텔릭 체 줄지 설정한 것
              fontStyle: FontStyle.italic,

              fontSize: 25,
              // fontWeight: FontWeight.w600,

              // 글자 모습을 정의할 수 있음
              // ~~ 글자를 ~~ 형태로
              // https://learn.microsoft.com/en-us/typography/opentype/spec/featuretags 참고
              fontFeatures: <ui.FontFeature>[
                // 폰트에서 이런 변형을 지원을 해야 먹는다..
                ui.FontFeature.alternative(2),
                ui.FontFeature.alternativeFractions(),
              ],

              fontVariations: [
                // 해당 폰트가 지원해야함
                ui.FontVariation('wght', 900),
              ],

              // 글자 입력 공간 높이
              height: 1.3,

              // 글자 간격
              letterSpacing: 1.0,

              // 단어 간격(스페이스 너비)
              // wordSpacing: 50.0,
              wordSpacing: 1.5,

              // textBaseline: TextBaseline.alphabetic :  알파벳 기준으로 선이 잡힘
              // textBaseline: TextBaseline.ideographic : 표의 문자 기준(한자 등)
              textBaseline: TextBaseline.ideographic,

              // 글꼴을 상위 context에서 상속 받을 것인지 여부..
              // true이면 현재 TextStyle에 정의 되지 않은 것들은 상위에 setting 된 값으로 받아온다.
              // false이면 상위 값을 받아오지 않는데, 만약 정의조차 되어있지 않다면 기본 값은 흰색, 14픽셀, 산세리프 글꼴이 된다.
              // 명시하지 않으면 true로 인식한다.
              inherit: true,

              // height가 null이 아닌 경우 수직 공간 분포
              // TextStyle.height * TextStyle.fontSize - TextStyle.fontSize
              // leadingDistribution: TextLeadingDistribution.even : 위 아래 균등
              // leadingDistribution: TextLeadingDistribution.proportional : 위에 비중을 더 줌
              leadingDistribution: TextLeadingDistribution.even,

              // TextStyle 내부의 overflow 보다 열등
              overflow: TextOverflow.ellipsis,
              shadows: [
                Shadow(
                  color: Colors.pink,
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),

            // text 수평 정렬 설정
            textAlign: TextAlign.start,

            // 문자 진행 방향 지정
            // 기본값은 왼 -> 오
            textDirection: TextDirection.ltr,

            // Text 위젯의 줄 간격과 텍스트 줄의 높이를 결정하는 속성
            // TextStyle에 height가 지정되지 않으면 아무 효과가 없다.
            textHeightBehavior: TextHeightBehavior(
              // applyHeightToFirstAscent를 true를 주면 첫 줄위에 공간이 생긴다.
              // TextStyle에 적용한 height 정도(height 1이 글자 높이 x1) 만큼 늘어난다.
              applyHeightToFirstAscent: true,
              // applyHeightToLastDescent를 true를 주면 마지막 줄 아래에 공간이 생긴다.(글 크기 정도)
              applyHeightToLastDescent: true,
            ),

            // 글꼴 크기 배율 정함
            // null 값이면 1.0
            // 큰 글씨 모드에 적용하면 좋음
            textScaleFactor: 1.0,

            // 위젯의 너비를 결정하는 값
            // 기본 값은 TextWidthBasis.parent로 부모 너비만큼 최대한 차지한다.
            // 또 다른 값으로는 longestLine가 있는데, 가장 긴 줄의 너비만큼만 차지한다.
            // 부모 위젯이 텍스트 위젯보다 너비가 좁으면 아무 효과를 볼 수 없음
            textWidthBasis: TextWidthBasis.longestLine,

            // 각 단락의 최소 높이를 설정할 수 있는 속성
            // 어떤 높이도 struct보다 짧을 수 없음
            strutStyle: StrutStyle(
              // 실제 폰트가 몇이든 텍스트 위젯 높이는 fontSize 기준으로 정함
              fontSize: 20.0,
              // height: 1.0,
              // fontStyle:
              // fontWeight:

              // 크기에 관여한다는 차이만 있을 뿐 자체 기능은 textStyle에서와 같음
              // fontFamily:
              // fontFamilyFallback:

              // strut 높이로 강제할 건지 정함
              // true로 정해지면 text에서 정한 height를 무시하고 strutStyle 높이로 강제함
              // 기본 값은 false..
              // forceStrutHeight: true,

              // height 값에 상관 없이 fontSize의 배수로 strut에 추가할 행간
              leading: 2.5,
              leadingDistribution: TextLeadingDistribution.proportional,
            ),
          ),
        ),
      ),
    );
  }
}

// class MySelectionRegistrar implements SelectionContainerDelegate {
//   @override
//   void add(Selectable selectable) {}
//
//   @override
//   void addListener(VoidCallback listener) {}
//
//   @override
//   Size get containerSize => Size(100, 50);
//
//   @override
//   SelectionResult dispatchSelectionEvent(SelectionEvent event) {
//     return SelectionResult.none;
//   }
//
//   @override
//   SelectedContent? getSelectedContent() {
//     return null;
//   }
//
//   @override
//   Matrix4 getTransformFrom(Selectable child) {
//     return Matrix4.zero();
//     // return Matrix4.identity();
//   }
//
//   @override
//   Matrix4 getTransformTo(RenderObject? ancestor) {
//     return Matrix4.zero();
//   }
//
//   @override
//   void pushHandleLayers(LayerLink? startHandle, LayerLink? endHandle) {}
//
//   @override
//   void remove(Selectable selectable) {}
//
//   @override
//   void removeListener(VoidCallback listener) {}
//
//   @override
//   SelectionGeometry get value => SelectionGeometry(status: SelectionStatus.none, hasContent: true);
// }
