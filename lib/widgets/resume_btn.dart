import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_portfolio/utils/methods/url_lunch.dart';

class ResumeButton extends HookWidget {
  final double height;
  final double width;
  const ResumeButton({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8.0,
            side: const BorderSide(width: 1, color: Colors.white),
            backgroundColor: const Color(0xff21a179),
            shape: const StadiumBorder(),
          ),
          onPressed: () async {
            Methods.openURL("https://drive.google.com/");
          },
          child: const FittedBox(
            child: Text(
              "RESUME",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
