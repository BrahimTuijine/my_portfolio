// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_portfolio/utils/methods/url_lunch.dart';

class ResumeButton extends HookWidget {
  final double height;
  final double width;
  final double fontSize;
  const ResumeButton({
    super.key,
    required this.height,
    required this.width,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8.0,
            side: BorderSide(width: 1.h, color: Colors.white),
            backgroundColor: const Color(0xff21a179),
            shape: const StadiumBorder(),
          ),
          onPressed: () async {
            Methods.openURL("https://drive.google.com/");
          },
          child: Text(
            "RESUME",
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
