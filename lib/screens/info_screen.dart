import 'package:calm_breathing/utils/constants.dart';
import 'package:calm_breathing/widgets/app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: MyAppBar(info: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "4-7-8 Breathing",
              style: TextStyle(
                color: lightGreen,
                fontSize: 22,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            const Text(
              "The 4-7-8 technique forces the mind and body to focus on regulating" +
                  "the breath, rather than replaying your worries when you lie down at night." +
                  " Proponents claim it can soothe a racing heart or calm frazzled nerves." +
                  " Dr. Weil has even described it as a “natural tranquilizer for the nervous system.”",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: lightGreen,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 12.0,
                right: 8.0,
              ),
              alignment: Alignment.centerRight,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url =
                              "https://www.healthline.com/health/4-7-8-breathing";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      text: "Source",
                      style: TextStyle(
                        color: lightGreen,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.open_in_new,
                        color: lightGreen,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
