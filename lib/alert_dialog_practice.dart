import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/default_scaffold.dart';

class AlertDialogPractice extends StatelessWidget {
  const AlertDialogPractice({Key? key}) : super(key: key);

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
                  context: context,
                  builder: (_) => AlertDialog(
                    // actions는 TextButton List라고 보면 된다.
                    actions: [
                      TextButton(onPressed: () {}, child: Text('확인')),
                      TextButton(onPressed: () {}, child: Text('취소')),
                    ],
                    // actions는 기본 alignment가 end
                    actionsAlignment: MainAxisAlignment.center,
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
