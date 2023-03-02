import 'package:flutter/material.dart';

class AbsorbPointerPractice extends StatefulWidget {
  const AbsorbPointerPractice({super.key});

  @override
  State<AbsorbPointerPractice> createState() => _AbsorbPointerPracticeState();
}

class _AbsorbPointerPracticeState extends State<AbsorbPointerPractice> {
  bool isIgnore = false;
  bool isAbsorb = false;

  void switchAbsorb() {
    setState(() {
      isAbsorb = !isAbsorb;
    });
  }

  void switchIgnore() {
    setState(() {
      isIgnore = !isIgnore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 280.0),
              child: Text('버튼을 누르면 가장 최상단에 있는 연두색 상자에 효과가 적용됩니다.'),
            ),
            SizedBox(
              width: 100,
              height: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: null,
              ),
            ),
            IgnorePointer(
              ignoring: isIgnore,
              child: AbsorbPointer(
                absorbing: isAbsorb,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _FAB(title: 'absorb', status: isAbsorb, callback: switchAbsorb),
          const SizedBox(width: 15.0),
          _FAB(title: 'ignore', status: isIgnore, callback: switchIgnore),
        ],
      ),
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB({
    Key? key,
    required this.title,
    required this.status,
    required this.callback,
  }) : super(key: key);
  final String title;
  final bool status;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: title,
      onPressed: callback,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 8.0),
          ),
          Text(
            status.toString(),
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
