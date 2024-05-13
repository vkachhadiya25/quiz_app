import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/home/controler/home_controler.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade300,
          title: const Text(
            "Result",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.22,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Correct Question ",
                            style: TextStyle(fontSize: 22, color: Colors.blue),
                          ),
                          Text(
                            "Total Question ",
                            style: TextStyle(fontSize: 22, color: Colors.blue),
                          ),
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${controller.totalScore} ",
                            style: const TextStyle(fontSize: 21, color: Colors.blue),
                          ),
                          Text(
                            "${controller.quizList.length}",
                            style: const TextStyle(fontSize: 21, color: Colors.blue),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed: () {
                            controller.totalScore.value = 0;
                            controller.index.value = 0;
                            controller.count.value =20;
                            controller.quizList.value = [];
                            Get.offAllNamed('home');
                          },
                          child: const Text(
                            "Relay Quiz",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
