import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_portfolio/widgets/animated_text.dart';
import 'package:my_portfolio/widgets/fade_animation_up.dart';
import 'package:my_portfolio/widgets/resume_btn.dart';

class MobileBody extends HookWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  children: const [
                    Text(
                      '<Brahim/>',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'DancingScript'),
                    ),
                    FadeAnimationUp(
                      child: ResumeButton(
                        height: 40,
                        width: 100,
                      ),
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
                const AnimatedText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
