import 'package:flutter/material.dart';
import 'home_page.dart'; // Assurez-vous d'importer votre page d'accueil ici
import 'widgets/drawer_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Utilisation de Future.delayed pour simuler une attente
    Future.delayed(Duration(seconds: 3), () {
      // Redirige vers la HomePage après 3 secondes
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.work_outline, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              'Bienvenue dans Portfolio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
