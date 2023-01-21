// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/onboardController.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final controller = OnboardController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.selectedPageIndex,
                    itemCount: controller.OnBoardPageController.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(controller
                                  .OnBoardPageController[index].Images),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                controller
                                    .OnBoardPageController[index].description,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.OnBoardPageController[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ]),
                      );
                    }),
                Positioned(
                  left: 170,
                  bottom: 20,
                  child: Row(
                      children: List.generate(
                    controller.OnBoardPageController.length,
                    (index) => Obx(
                      () {
                        return Container(
                          margin: EdgeInsets.all(3),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                  ? Colors.red
                                  : Colors.grey,
                              shape: BoxShape.circle),
                        );
                      },
                    ),
                  )),
                ),
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: FloatingActionButton(
                onPressed: () {
                  controller.forward();
                },
                //   child: Obx(
                //     () {
                //       return Text(
                //         controller.LastPage ? "End" : "Back",
                //         style: TextStyle(fontSize: 15),
                //       );
                //     },
                //   ),
                // ),
                // FloatingActionButton(
                //   onPressed: () {
                //     controller.forward();
                //   },
                child: Obx(
                  () {
                    return Text(
                      controller.LastPage ? "Start" : "Next",
                      style: TextStyle(fontSize: 15),
                    );
                  },
                ),
              ),
            )));
  }
}
