import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedContainerPractice extends StatefulWidget {
  const AnimatedContainerPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerPractice> createState() => _AnimatedContainerPracticeState();
}

class _AnimatedContainerPracticeState extends State<AnimatedContainerPractice> {
  bool isChanged = false;

  void changeState() {
    setState(() {
      isChanged = !isChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 1);

    const alignmentA = Alignment(-0.3, -0.3);
    const alignmentB = Alignment(0.8, 0.3);

    const colorA = Colors.lightBlueAccent;
    const colorB = Colors.orangeAccent;

    final matrixA = Matrix4.rotationZ(0);
    final matrixB = Matrix4.rotationZ(30);
    return DefaultScaffold(
      body: ColoredBox(
        color: Colors.black,
        child: AnimatedContainer(
          duration: duration,
          transform: isChanged ? matrixA : matrixB,

          // transform이 적용된 후에 Alignment
          transformAlignment: const Alignment(0.3, 1),
          width: isChanged ? 100 : 200,
          height: isChanged ? 100 : 200,
          curve: Curves.ease,
          alignment: isChanged ? alignmentA : alignmentB,
          color: isChanged ? colorA : colorB,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeState,
        isExtended: true,
        child: const Text('changeState'),
      ),
    );
  }
}
