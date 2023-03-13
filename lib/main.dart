import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/desktop.dart';
import 'package:my_portfolio/screens/mobile.dart';
import 'package:my_portfolio/responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Barlow',
        primarySwatch: Colors.deepPurple,
      ),
      home: const ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
