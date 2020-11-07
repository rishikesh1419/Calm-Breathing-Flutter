import 'package:flutter/material.dart';

class TwoStage extends StatefulWidget {
  @override
  _TwoStageState createState() => _TwoStageState();
}

class _TwoStageState extends State<TwoStage> with TickerProviderStateMixin {
  AnimationController _breathingController;
  String _action = 'Breathe In';
  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1750),
    )
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _breathingController.duration = const Duration(milliseconds: 2750);
        _action = 'Breathe Out';
        _breathingController.reverse();
      } else if (status == AnimationStatus.dismissed) {
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