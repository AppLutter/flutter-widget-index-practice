import 'package:flutter/material.dart';

Future<void> navigateToPage({required BuildContext context, required Widget widget}) async {
  Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
}
