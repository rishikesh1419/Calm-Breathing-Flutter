import 'dart:async';

import 'package:calm_breathing/utils/constants.dart';
import 'package:flutter/material.dart';

class ThreeStage extends StatefulWidget {
  @override
  _ThreeStageState createState() => _ThreeStageState();
}

class _ThreeStageState extends State<ThreeStage> with TickerProviderStateMixin {
  AnimationController _breathingController;
  String _action;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _action = 'Breathe In';
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _action = 'Hold';
        _timer = Timer(const Duration(milliseconds: 3500), () {
          _breathingController.duration = const Duration(seconds: 4);
          _action = 'Breathe Out';
          _breathingController.reverse();
        });
      }
      else if(status == AnimationStatus.dismissed) {
        _breathingController.duration = const Duration(seconds: 2);
        _action = 'Breathe In';
        _breathingController.forward();
      }
    })
    ..addListener(() {
      setState(() {
      });
    });
    _breathingController.forward();
  }

  @override
  void dispose() {
    _breathingController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 210.0 + 70 * _breathingController.value,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              greenAccent,
              greenAccent,
              greenAccent,
              greenAccent,
              Colors.black,
            ]),
            shape: BoxShape.circle,
          ),
          // child: Center(child: Text(_action)),
        ),
        Container(
          height: 160.0 + 50 * _breathingController.value,
          decoration: BoxDecoration(
            color: greenAccent,
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(_action)),
        ),
      ],
    );
  }
}