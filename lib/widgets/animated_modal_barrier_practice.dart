import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';

class AnimatedModalBarrierPractice extends StatefulWidget {
  const AnimatedModalBarrierPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedModalBarrierPractice> createState() => _AnimatedModalBarrierPracticeState();
}

class _AnimatedModalBarrierPracticeState extends State<AnimatedModalBarrierPractice>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    /// tween을 ColorTween으로 해야 오류가 안남(오류나도 어차피 알려줌)
    animation = ColorTween(begin: Colors.transparent, end: Colors.blueAccent).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      if (animationController.isCompleted) {
                        animationController.reset();
                      }
                      animationController.forward();
                    },
                    child: Text('배리어 활성화 !!')),
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: AnimatedModalBarrier(
                  color: animation,
                  /// dismissible: true면 배리어를 누르는 순간 현재 Navigator를 pop 해버림
                  dismissible: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
