import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(CalmBreathing());
}

class CalmBreathing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
