import 'package:flutter/material.dart';
import 'package:my_portfolio/desktop/desktop.dart';
import 'package:my_portfolio/mobile/mobile.dart';
import 'package:my_portfolio/responsive/responsive_layout.dart';
import 'package:my_portfolio/tablet/tablet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileBody: MobileBody(),
        tabletBody: TabletBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
