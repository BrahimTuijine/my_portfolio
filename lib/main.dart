import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/screens/desktop.dart';
import 'package:my_portfolio/screens/mobile.dart';
import 'package:my_portfolio/screens/tablet.dart';
import 'package:my_portfolio/utils/responsive/responsive_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: const ResponsiveLayout(
                mobileBody: MobileBody(),
                desktopBody: DesktopBody(),
                tabletBody: TabletBody(),
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Barlow',
            primarySwatch: Colors.deepPurple,
          ),
        ),
      );
}
