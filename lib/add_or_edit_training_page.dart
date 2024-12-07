import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'training.dart';

class AddOrEditTrainingPage extends StatefulWidget {
  final Training? training;

  AddOrEditTrainingPage({this.training});

  @override
  _AddOrEditTrainingPageState createState() => _AddOrEditTrainingPageState();
}

class _AddOrEditTrainingPageState extends State<AddOrEditTrainingPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _institutionController = TextEditingController();
  final _yearController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.training != null) {
      _titleController.text = widget.training!.title;
      _institutionController.text = widget.training!.institution;
      _yearController.text = widget.training!.year;
      _descriptionController.text = widget.training!.description;
    }
  }

  Future<void> _saveTraining() async {
    if (_formKey.currentState!.validate()) {
      final training = Training(
        id: widget.training?.id,
        title: _titleController.text,
        institution: _institutionController.text,
        year: _yearController.text,
        description: _descriptionController.text,
      );

      if (widget.training == null) {
        await DatabaseHelper().insertTraining(training);
      } else {
        await DatabaseHelper().updateTraining(training);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.training == null ? "Add Training" : "Edit Training"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) => value!.isEmpty ? "Enter title" : null,
              ),
              TextFormField(
                controller: _institutionController,
                decoration: InputDecoration(labelText: "Institution"),
                validator: (value) =>
                    value!.isEmpty ? "Enter institution" : null,
              ),
              TextFormField(
                controller: _yearController,
                decoration: InputDecoration(labelText: "Year"),
                validator: (value) => value!.isEmpty ? "Enter year" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description"),
                validator: (value) =>
                    value!.isEmpty ? "Enter description" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTraining,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
