import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_page.dart';
import 'projects_page.dart';
import 'trainings_page.dart';
import 'add_or_edit_project_page.dart';
import 'add_or_edit_training_page.dart';

void main() => runApp(PortfolioApp());

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Dynamique',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => HomePage(),
        '/projects': (context) => ProjectsPage(),
        '/addOrEditProject': (context) => AddOrEditProjectPage(),
        '/trainings': (context) => TrainingsPage(),
        '/addOrEditTraining': (context) => AddOrEditTrainingPage(),
      },
    );
  }
}
