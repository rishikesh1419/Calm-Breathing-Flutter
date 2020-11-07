import 'package:calm_breathing/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'breathing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Calm Breathing")),
      appBar: MyAppBar(home: true),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200.0,
                    child: const Text(
                      "Calm Breathing",
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Breathing(pattern: '7/11 Breathing');
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: const Text("7/11 Pattern"),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Breathing(pattern: '4-7-8 Breathing');
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: const Text("4-7-8 Pattern"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
