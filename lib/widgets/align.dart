import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AlignPractice extends StatelessWidget {
  const AlignPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
