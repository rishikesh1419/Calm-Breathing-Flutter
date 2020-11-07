import 'package:calm_breathing/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(info: true),
      body: Center(
        child: const Text("Info Screen"),
      ),
    );
  }
}
