import 'package:calm_breathing/widgets/breather_error.dart';
import 'package:calm_breathing/widgets/three_stage.dart';
import 'package:calm_breathing/widgets/two_stage.dart';
import 'package:flutter/material.dart';

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
        breather = TwoStage();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pattern),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pattern),
                breather != null ? breather : BreatherError(),
              ],
            ),
          ),
        ],
      )
    );
  }
}