import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_portfolio/constants/constants.dart';

class DesktopBody extends HookWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(left: 50, top: 10, right: 50, bottom: 25),
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
              children: [
                const Text(
                  '<Brahim/>',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  width: 250,
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: greenColor,
                    tabs: const [
                      Tab(child: Text('ABOUT')),
                      Tab(child: Text('PROJECTS')),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                    backgroundColor: greenColor,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('RESUME'),
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  Text(
                    'first Page',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_balance_sharp,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_balance_sharp,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_balance_sharp,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Made With Flutter Web @ 2023',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
