import 'dart:async';

import 'package:flutter/material.dart';

class ThreeStage extends StatefulWidget {
  @override
  _ThreeStageState createState() => _ThreeStageState();
}

class _ThreeStageState extends State<ThreeStage> with TickerProviderStateMixin {
  AnimationController _breathingController;
  String _action = 'Breathe In';

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _action = 'Hold';
        Timer(const Duration(milliseconds: 3500), () {
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
  Widget build(BuildContext context) {
    return Container(
      height: 180.0 + 50* _breathingController.value,
      decoration: BoxDecoration(
      color: Colors.greenAccent,
        shape: BoxShape.circle,
      ),
      child: Center(child: Text(_action)),
    );
  }
}