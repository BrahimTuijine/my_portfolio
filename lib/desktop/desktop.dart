import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/constants/constants.dart';

class DesktopBody extends HookWidget {
  const DesktopBody({Key? key}) : super(key: key);

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
                const AutoSizeText(
                  '<Brahim/>',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      fontFamily: 'DancingScript'),
                ),
                SizedBox(
                  width: 250,
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: greenColor,
                    tabs: const [
                      Tab(
                          child: AutoSizeText(
                        'ABOUT',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      Tab(
                          child: AutoSizeText(
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
                        child: SizedBox(
                          height: 45,
                          width: 110,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 8.0,
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                backgroundColor: const Color(0xff21a179),
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: const AutoSizeText(
                                "RESUME",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
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
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText.rich(
                            TextSpan(
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
                          AutoSizeText(
                            textAlign: TextAlign.justify,
                            "3arref nafsek" * 7,
                            style: const TextStyle(
                                color: Colors.white54,
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.03,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const AutoSizeText(
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
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const AutoSizeText(
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
