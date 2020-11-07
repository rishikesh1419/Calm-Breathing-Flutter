import 'package:calm_breathing/screens/info_screen.dart';
import 'package:calm_breathing/utils/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  final bool info;
  const MyAppBar({Key key, this.home, this.info}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparent,
      elevation: 0.0,
      leading: home == null
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: green,
              ))
          : null,
      actions: info == null
          ? [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info,
                    color: green,
                  ),
                ),
              ),
            ]
          : null,
    );
  }
}
