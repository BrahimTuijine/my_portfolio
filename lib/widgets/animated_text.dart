import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedText extends HookWidget {
  const AnimatedText({
    super.key,
  });

  final String text = ''' I'm very interested in mobile development and embedded
systems, looking for an internship or professional opportunity to
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
          textAlign: TextAlign.center,
          '${animation.value}',
          style: const TextStyle(
              color: Colors.white54,
              fontFamily: 'DMSerifDisplay',
              fontSize: 14.2),
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
