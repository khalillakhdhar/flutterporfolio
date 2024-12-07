import 'package:flutter/material.dart';
import 'widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue sur mon Portfolio !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              icon: Icon(Icons.work),
              label: Text('Projets'),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/trainings'),
              icon: Icon(Icons.school),
              label: Text('Formations'),
            ),
          ],
        ),
      ),
    );
  }
}
