import 'package:flutter/material.dart';
import 'TwoStage.dart';
import 'ThreeStage.dart';
import '../widgets/BreatherError.dart';

class Breathing extends StatelessWidget {
  final String pattern;

  Breathing({Key key, @required this.pattern})
  : assert(pattern != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget breather;

    switch (pattern) {
      case '7/11 Breathing':
        breather = TwoStage();
        break;
      case '4-7-8 Breathing' :
        breather = ThreeStage();
        break;
      default:
        breather = ThreeStage();
        break;
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(pattern),
            breather != null ? breather : BreatherError(),
          ],
        ),
      )
    );
  }
}