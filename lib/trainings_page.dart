import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'training.dart';
import 'add_or_edit_training_page.dart';

class TrainingsPage extends StatefulWidget {
  @override
  _TrainingsPageState createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  List<Training> _trainings = [];

  @override
  void initState() {
    super.initState();
    _loadTrainings();
  }

  Future<void> _loadTrainings() async {
    final trainings = await DatabaseHelper().getTrainings();
    setState(() {
      _trainings = trainings;
    });
  }

  void _deleteTraining(int id) async {
    await DatabaseHelper().deleteTraining(id);
    _loadTrainings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trainings")),
      body: ListView.builder(
        itemCount: _trainings.length,
        itemBuilder: (context, index) {
          final training = _trainings[index];
          return ListTile(
            title: Text(training.title),
            subtitle: Text(training.institution),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteTraining(training.id!),
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddOrEditTrainingPage(training: training),
                ),
              );
              _loadTrainings();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOrEditTrainingPage()),
          );
          _loadTrainings();
        },
      ),
    );
  }
}
