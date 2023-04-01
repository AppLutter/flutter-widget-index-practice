import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_index_practice/common/default_scaffold.dart';
import 'package:flutter_widget_index_practice/mocks/user_models.dart';

import '../models/user_model/user_model.dart';

class AnimatedListPractice extends StatefulWidget {
  const AnimatedListPractice({Key? key}) : super(key: key);

  @override
  State<AnimatedListPractice> createState() => _AnimatedListPracticeState();
}

class _AnimatedListPracticeState extends State<AnimatedListPractice> {
  GlobalKey<AnimatedListState> animatedListState = GlobalKey<AnimatedListState>();
  late List<UserModel> _userModels;

  @override
  void initState() {
    super.initState();
    _userModels = List<UserModel>.from(userModels);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      if (_userModels.isEmpty) return;
                      final _userModelsIndex = _userModels.length;
                      final randomIndex = Random().nextInt(_userModelsIndex);
                      animatedListState.currentState?.removeItem(
                          0,
                          (context, animation) => FadeTransition(
                                opacity: animation,
                                child: Container(
                                  height: 50,
                                  color: Colors.green,
                                ),
                              ),
                          duration: const Duration(seconds: 2));
                      _userModels.removeAt(randomIndex);
                      setState(() {});
                    },
                    child: Text('랜덤 제거'),
                  ),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      final randomIndex = Random().nextInt(userModels.length);
                      animatedListState.currentState?.insertItem(0);
                      setState(() {
                        _userModels.insert(0, userModels[randomIndex]);
                      });
                    },
                    child: Text('랜덤 추가'),
                  ),
                ],
              ),
            ),
            Text('${_userModels.length}개 입니다'),
            AnimatedList(
              key: animatedListState,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              initialItemCount: _userModels.length,
              itemBuilder: (context, index, animation) {
                return AnimatedTile(
                  key: ValueKey(index.toString()),
                  animation: animation,
                  model: _userModels[index],
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTile extends StatelessWidget {
  const AnimatedTile({
    Key? key,
    required this.animation,
    required this.model,
    required this.index,
  }) : super(key: key);
  final Animation<double> animation;
  final UserModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        color: Colors.accents[index % Colors.accents.length],
        height: 50,
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(index.toString()),
            SizedBox(width: 10),
            Text(model.name.toString()),
            SizedBox(width: 10),
            Text(model.age.toString()),
          ],
        ),
      ),
    );
  }
}
