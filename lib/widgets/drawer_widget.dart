import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 80, color: Colors.white),
                Text(
                  'Mon Portfolio',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Projets'),
            onTap: () => Navigator.pushNamed(context, '/projects'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Formations'),
            onTap: () => Navigator.pushNamed(context, '/trainings'),
          ),
        ],
      ),
    );
  }
}
