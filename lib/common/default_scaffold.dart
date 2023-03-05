import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key? key,
    required this.body,
    this.floatingActionButton,
  }) : super(key: key);
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
