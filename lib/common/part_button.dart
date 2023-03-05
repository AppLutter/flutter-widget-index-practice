import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/common_navigate.dart';

class PartButton extends StatelessWidget {
  const PartButton({
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