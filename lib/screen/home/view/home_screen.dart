import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/home/controler/home_controler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    controller.getQuiz();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/image/bg.jpeg",
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Get.toNamed('question');
                },
                child: const Text(
                  "Start",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
