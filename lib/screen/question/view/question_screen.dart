import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/home/controler/home_controler.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  HomeController controller = Get.put(HomeController());
  int seconds = 20;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        seconds--;
      });
      startTimer();
    });

    if (seconds == 0) {
      seconds = 20;
      controller.questionNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Question"),
        ),
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amber, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
              child: Obx(
                () => controller.quizList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            // Stack(
                            //   alignment: Alignment.center,
                            //   children: [
                            //     Text(
                            //       '$seconds',
                            //       style: const TextStyle(
                            //           color: Colors.black, fontSize: 24),
                            //     ),
                            //     SizedBox(
                            //       width: 60,
                            //       height: 60,
                            //       child: CircularProgressIndicator(
                            //         value: seconds / 20,
                            //         valueColor:
                            //             const AlwaysStoppedAnimation(
                            //                 Colors.black),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 25),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Question :-',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => Text(
                                "${controller.quizList[controller.index.value].question}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  options(
                                      'A. ${controller.quizList[controller.index.value].option![0]}'),
                                  options(
                                      'B. ${controller.quizList[controller.index.value].option![1]}'),
                                  options(
                                      'C. ${controller.quizList[controller.index.value].option![2]}'),
                                  options(
                                      'D. ${controller.quizList[controller.index.value].option![3]}'),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  // Align(
                                  //   alignment: Alignment.centerRight,
                                  //   child: ElevatedButton(
                                  //     onPressed: () {
                                  //       controller.questionNext();
                                  //       seconds = 20;
                                  //       startTimer();
                                  //     },
                                  //     child: const Text('Next Question'),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     if (controller.index.value ==
        //         controller.homeModel.value!.resultList!.length - 1) {
        //     } else {}
        //   },
        //   label: Text(controller.index.value ==
        //           controller.homeModel.value!.resultList!.length - 1
        //       ? "Submit"
        //       : "Next"),
        // ),
      ),
    );
  }

  InkWell options(String text,String optionIndex) {
    bool isCorrect = optionIndex == controller.quizList[controller.index.value].correct_answer;
    return InkWell(
      onTap: () {
        if(isCorrect)
          {
              const SnackBar(content: Text("Answer is correct..."));
          }
        else
          {
            const SnackBar(content: Text("Answer is wrong..."));

          }
        controller.questionNext();
        // seconds = 20;
        // startTimer();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
