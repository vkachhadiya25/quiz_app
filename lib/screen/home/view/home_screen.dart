import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              "assets/image/wallpaper.jpeg",
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('question');
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                  child: const Center(
                      child: Text(
                    "Start",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.blue),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
