// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedText extends HookWidget {
  final bool isMobile;
  final double fontSize;
  const AnimatedText({
    super.key,
    required this.isMobile,
    required this.fontSize,
  });

  final String text =
      ''' I'm very interested in mobile development , looking for
an internship or professional opportunity to
acquire more practical skills and competencies and well socialize
in a professional industry. ''';

  @override
  Widget build(BuildContext context) {
    final AnimationController controller =
        useAnimationController(duration: const Duration(seconds: 5));

    final Animation animation = TypeWriterTween(end: text).animate(controller);

    useEffect(() {
      controller.forward();
      return null;
    }, const []);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Text(
          textAlign: isMobile ? TextAlign.center : null,
          '${animation.value}',
          style: TextStyle(
              color: Colors.white54,
              fontFamily: 'DMSerifDisplay',
              fontSize: fontSize),
        );
      },
    );
  }
}

class TypeWriterTween extends Tween<String> {
  TypeWriterTween({String begin = '', required String end})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var cutoff = (end!.length * t).round();
    return end!.substring(0, cutoff);
  }
}
