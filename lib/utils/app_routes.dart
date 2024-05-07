import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home/view/home_screen.dart';
import 'package:quiz_app/screen/question/view/question_screen.dart';
import 'package:quiz_app/screen/result/view/result_screen.dart';
import 'package:quiz_app/screen/spleash/view/splesh_screen.dart';

Map<String,WidgetBuilder>  app_routes =
{
  '/' : (context) => const SpleshScreen(),
  'home' : (context) => const HomeScreen(),
  'question' : (context) => const QuestionsScreen(),
  'result' : (context) => const ResultScreen(),
};

