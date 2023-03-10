import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MobileBody extends HookWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2a0e3c),
              Color(0xff050824),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '<Brahim/>',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  '<Brahim/>',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
                Text(
                  '<Brahim/>',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
