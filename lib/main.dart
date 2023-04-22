import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/part_button.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Exo2',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: CupertinoColors.systemIndigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 35.0,
            ),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const _MainHome(),
    );
  }
}

class _MainHome extends StatelessWidget {
  const _MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(toString()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          PartButton(child: AbsorbPointerPractice()),
          PartButton(child: AlertDialogPractice()),
          PartButton(child: AlignPractice()),
          PartButton(child: AnimatedAlignPractice()),
          PartButton(child: AnimatedBuilderPractice()),
          PartButton(child: AnimatedBuilderPractice2()),
          PartButton(child: AnimatedContainerPractice()),
          PartButton(child: AnimatedCrossFadePractice()),
          PartButton(child: AnimatedCrossFadePractice2()),
          PartButton(child: AnimatedDefaultTextStylePractice()),
          PartButton(child: TextPractice()),
          PartButton(child: TextPractice2()),
          PartButton(child: AnimatedListPractice()),
          PartButton(child: AnimatedModalBarrierPractice()),
          PartButton(child: AnimatedOpacityPractice()),
          PartButton(child: AnimatedPhysicalModelPractice()),
          PartButton(child: AnimatedPositionedPractice()),
          PartButton(child: AnimatedSizePractice()),
        ],
      ),
    );
  }
}
