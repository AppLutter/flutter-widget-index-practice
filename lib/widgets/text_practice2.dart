import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TextPractice2 extends StatelessWidget {
  const TextPractice2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const text = '안녕하세요 외계인 입니다.';
    const textStyle = TextStyle(fontSize: 40.0);
    final size = TextUtil.getTextSize(text: text, textStyle: textStyle);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              text,
              // textWidthBasis: TextWidthBasis.parent,
              style: textStyle.copyWith(
                backgroundColor: Colors.orange,

                // foreground: Paint()
                //   ..shader = ui.Gradient.linear(
                //     Offset(size.width / 3, size.height * 2),
                //     Offset(size.width, size.height * 2),
                //     [Colors.red, Colors.green],
                //   ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextUtil {
  static Size getTextSize({
    required String text,
    required TextStyle textStyle,
  }) {
    TextSpan textSpan = TextSpan(text: text, style: textStyle);
    TextPainter tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);

    tp.layout();
    return Size(tp.width, tp.height);
  }
}