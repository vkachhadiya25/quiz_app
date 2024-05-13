import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/home/controler/home_controler.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue.shade300,
          centerTitle: true,
          title: const Text("Question"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Obx(
              () => controller.quizList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Obx(() => Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "${controller.count}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: CircularProgressIndicator(
                                      value: controller.count / 20,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Question :- ${controller.index.value + 1}',
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => Text(
                              "${controller.quizList[controller.index.value].question}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                options(
                                    '${controller.quizList[controller.index.value].option![0]}'),
                                options(
                                    '${controller.quizList[controller.index.value].option![1]}'),
                                options(
                                    '${controller.quizList[controller.index.value].option![2]}'),
                                options(
                                    '${controller.quizList[controller.index.value].option![3]}'),
                                const SizedBox(
                                  height: 50,
                                ),
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
    );
  }

  InkWell options(String text) {
    return InkWell(
      onTap: () {
        controller.result(text);

        if (controller.index.value != controller.quizList.length - 1) {
          controller.count.value = 20;
          controller.index.value = controller.index.value + 1;
        } else {
          controller.timer!.cancel();
          Get.offAllNamed('result');
        }
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 3)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
