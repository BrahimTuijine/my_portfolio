// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  final Widget tabletBody;

  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    required this.desktopBody,
    required this.tabletBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return mobileBody;
        } else if (constraints.maxWidth < 900) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
