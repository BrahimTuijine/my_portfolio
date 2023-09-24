import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/widgets/animated_text.dart';
import 'package:my_portfolio/widgets/project_list.dart';
import 'package:my_portfolio/widgets/resume_btn.dart';

class MobileBody extends HookWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff2a0e3c),
                Color(0xff050824),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '<Brahim/>',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                          fontFamily: 'DancingScript'),
                    ),
                    ResumeButton(
                      height: 40.h,
                      width: width * .25,
                      fontSize: 10.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                const FlutterLogo(
                  size: 100,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: AnimatedText(
                    fontSize: 10.sp,
                    isMobile: true,
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "What I've build",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xffCCD6F6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Container(
                      width: 100.w,
                      height: 1.10,
                      color: const Color(0xff303C55),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Expanded(
                  child: ProjectListWiget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
