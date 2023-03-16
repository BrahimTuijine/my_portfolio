import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final animation = Tween<double>(begin: 30, end: 0)
        .animate(CurvedAnimation(parent: animController, curve: Curves.easeIn));

    final animationOp = Tween<double>(begin: 0, end: 1).animate(animController);

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: animController,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: animationOp.value,
                          child: Transform.translate(
                            offset: Offset(0, animation.value),
                            child: const Text(
                              '<Brahim/>',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'DancingScript'),
                            ),
                          ),
                        );
                      },
                    ),
                    // const Spacer(),
                    AnimatedBuilder(
                      animation: animController,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: animationOp.value,
                          child: Transform.translate(
                            offset: Offset(0, animation.value),
                            child: ResumeButton(height: 40, width: width * .25),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const FlutterLogo(
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 100,
                  child: AnimatedText(
                    fontSize: 14.2,
                    isMobile: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
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
                                    height: 150,
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
                                    margin: const EdgeInsets.only(top: 20),
                                    height: 100,
                                    width: width / 2,
                                    color: const Color(0xff21a179),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text('hello ' * 10),
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
