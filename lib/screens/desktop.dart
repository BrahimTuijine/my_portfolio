import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_portfolio/utils/constants/constants.dart';
import 'package:my_portfolio/utils/methods/url_lunch.dart';
import 'package:my_portfolio/widgets/animated_text.dart';
import 'package:my_portfolio/widgets/resume_btn.dart';

class DesktopBody extends HookWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    final animation = Tween<double>(begin: 30, end: 0)
        .animate(CurvedAnimation(parent: animController, curve: Curves.easeIn));

    final animationOp = Tween<double>(begin: 0, end: 1).animate(animController);

    useEffect(() {
      animController.forward();
      return null;
    }, const []);

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final tabController = useTabController(initialLength: 2);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 50,
          top: 10,
          right: 50,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff300e46),
              Color(0xff040827),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                              fontSize: 36,
                              fontFamily: 'DancingScript'),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 250,
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: greenColor,
                    tabs: const [
                      Tab(
                          child: Text(
                        'ABOUT',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      Tab(
                          child: Text(
                        'PROJECTS',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: animController,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: animationOp.value,
                      child: Transform.translate(
                        offset: Offset(0, animation.value),
                        child: const ResumeButton(height: 45, width: 110),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * .8,
              child: TabBarView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Hi, my name is \n',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30 * 2.25,
                                  fontFamily: 'DMSerifDisplay'),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Brahim Tuijine',
                                    style: TextStyle(color: greenColor)),
                                const TextSpan(text: ' !'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * .02,
                          ),
                          const AnimatedText(fontSize: 14.2, isMobile: false),
                        ],
                      ),
                      // SizedBox(
                      //   width: screenWidth / 4,
                      // ),
                      const FlutterLogo(
                        size: 200,
                      )
                    ],
                  ),
                  const Text(
                    'second Page',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: screenHeight * 0.07,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05, right: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: screenHeight * 0.05,
                            icon: const Icon(FontAwesomeIcons.github),
                            onPressed: () {},
                            color: Colors.white),
                        SizedBox(
                          width: screenHeight * 0.021,
                        ),
                        IconButton(
                            iconSize: screenHeight * 0.05,
                            icon: const Icon(FontAwesomeIcons.linkedin),
                            onPressed: () {},
                            color: Colors.blueAccent),
                        SizedBox(
                          width: screenHeight * 0.021,
                        ),
                        SizedBox(
                          height: screenHeight,
                          child: IconButton(
                            icon: Icon(
                              Icons.email,
                              size: screenHeight * 0.055,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Methods.launchEmail();
                            },
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Made with Flutter \u00a9 2023",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
