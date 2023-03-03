import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/absorb_pointer_practice.dart';
import 'package:flutter_widget_index_practice/alert_dialog_practice.dart';
import 'package:flutter_widget_index_practice/common_navigate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
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
          _PartButton(child: AbsorbPointerPractice()),
          _PartButton(child: AlertDialogPractice()),
        ],
      ),
    );
  }
}

class _PartButton extends StatelessWidget {
  const _PartButton({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          navigateToPage(context: context, widget: child);
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            child.toString(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
