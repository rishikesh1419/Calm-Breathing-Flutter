import 'package:calm_breathing/screens/info_screen.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  const MyAppBar({Key key, this.home}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: home ? null : Icon(Icons.arrow_back),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InfoScreen();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.info),
          ),
        ),
      ],
    );
  }
}
