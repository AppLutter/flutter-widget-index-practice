import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/part_button.dart';
import 'package:flutter_widget_index_practice/widgets/absorb_pointer_practice.dart';
import 'package:flutter_widget_index_practice/widgets/alert_dialog_practice.dart';
import 'package:flutter_widget_index_practice/widgets/align.dart';
import 'package:flutter_widget_index_practice/widgets/animated_align_practice.dart';

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
        ],
      ),
    );
  }
}
