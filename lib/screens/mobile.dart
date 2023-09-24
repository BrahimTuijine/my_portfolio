import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/widgets/animated_text.dart';
import 'package:my_portfolio/widgets/resume_btn.dart';

class MobileBody extends HookWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final animController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final animRight = Tween<double>(begin: -((width / 2) + 20), end: 0)
        .animate(animController);

    final animLeft =
        Tween<double>(begin: (width / 2) + 20, end: 0).animate(animController);

    useEffect(() {
      animController.forward();
      return null;
    }, const []);

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
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                  child: ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedBuilder(
                        animation: animController,
                        builder: (BuildContext context, Widget? child) {
                          return Stack(
                            children: [
                              Transform.translate(
                                offset: Offset(animRight.value, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 150.h,
                                    width: width / 2,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(animLeft.value, 0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: 100.h,
                                    width: width / 2,
                                    color: const Color(0xff21a179),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      child: Center(
                                          child: Text(
                                        'hello ' * 10,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
