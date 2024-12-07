import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'project.dart';

class AddOrEditProjectPage extends StatefulWidget {
  final Project? project;

  AddOrEditProjectPage({this.project});

  @override
  _AddOrEditProjectPageState createState() => _AddOrEditProjectPageState();
}

class _AddOrEditProjectPageState extends State<AddOrEditProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  final _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      _titleController.text = widget.project!.title;
      _descriptionController.text = widget.project!.description;
      _durationController.text = widget.project!.duration;
      _linkController.text = widget.project!.link;
    }
  }

  Future<void> _saveProject() async {
    if (_formKey.currentState!.validate()) {
      final project = Project(
        id: widget.project?.id,
        title: _titleController.text,
        description: _descriptionController.text,
        duration: _durationController.text,
        link: _linkController.text,
      );

      if (widget.project == null) {
        await DatabaseHelper().insertProject(project);
      } else {
        await DatabaseHelper().updateProject(project);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project == null ? "Add Project" : "Edit Project"),
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
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description"),
                validator: (value) =>
                    value!.isEmpty ? "Enter description" : null,
              ),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: "Duration"),
                validator: (value) => value!.isEmpty ? "Enter duration" : null,
              ),
              TextFormField(
                controller: _linkController,
                decoration: InputDecoration(labelText: "Link"),
                validator: (value) => value!.isEmpty ? "Enter link" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProject,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
