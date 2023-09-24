import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectListWiget extends HookWidget {
  const ProjectListWiget({super.key});

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
    return ListView.separated(
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
    );
  }
}
