import 'package:calm_breathing/utils/constants.dart';
import 'package:flutter/material.dart';

class TwoStage extends StatefulWidget {
  @override
  _TwoStageState createState() => _TwoStageState();
}

class _TwoStageState extends State<TwoStage> with TickerProviderStateMixin {
  AnimationController _breathingController;
  String _action;
  @override
  void initState() {
    super.initState();
    _action = 'Breathe In';
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1750),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _breathingController.duration = const Duration(milliseconds: 2750);
          _action = 'Breathe Out';
          _breathingController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _action = 'Breathe In';
          _breathingController.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    _breathingController.forward();
  }

  @override
  void dispose() {
    _breathingController.dispose();
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
