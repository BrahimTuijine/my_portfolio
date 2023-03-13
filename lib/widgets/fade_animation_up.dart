import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeAnimationUp extends HookWidget {
  final Widget child;
  const FadeAnimationUp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final animController = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    final animation = Tween<double>(begin: 70, end: 0)
        .animate(CurvedAnimation(parent: animController, curve: Curves.easeIn));

    final animationOp = Tween<double>(begin: 0, end: 1).animate(animController);

    useEffect(() {
      animController.forward();
      return null;
    }, const []);
    return AnimatedBuilder(
      animation: animController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animationOp.value,
          child: Transform.translate(
            offset: Offset(0, animation.value),
            child: child,
          ),
        );
      },
    );
  }
}
