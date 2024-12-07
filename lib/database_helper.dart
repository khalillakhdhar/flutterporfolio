import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'project.dart';
import 'training.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'portfolio.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE projects (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            duration TEXT,
            link TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE trainings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            institution TEXT,
            year TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  // CRUD for Projects
  Future<int> insertProject(Project project) async {
    final db = await database;
    return db.insert('projects', project.toMap());
  }

  Future<List<Project>> getProjects() async {
    final db = await database;
    final maps = await db.query('projects');
    return List.generate(maps.length, (i) {
      return Project(
        id: maps[i]['id'] as int?,
        title: maps[i]['title'] as String,
        description: maps[i]['description'] as String,
        duration: maps[i]['duration'] as String,
        link: maps[i]['link'] as String,
      );
    });
  }

  Future<int> updateProject(Project project) async {
    final db = await database;
    return db.update(
      'projects',
      project.toMap(),
      where: 'id = ?',
      whereArgs: [project.id],
    );
  }

  Future<int> deleteProject(int id) async {
    final db = await database;
    return db.delete(
      'projects',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD for Trainings
  Future<int> insertTraining(Training training) async {
    final db = await database;
    return db.insert('trainings', training.toMap());
  }

  Future<List<Training>> getTrainings() async {
    final db = await database;
    final maps = await db.query('trainings');
    return List.generate(maps.length, (i) {
      return Training(
        id: maps[i]['id'] as int?,
        title: maps[i]['title'] as String,
        institution: maps[i]['institution'] as String,
        year: maps[i]['year'] as String,
        description: maps[i]['description'] as String,
      );
    });
  }

  Future<int> updateTraining(Training training) async {
    final db = await database;
    return db.update(
      'trainings',
      training.toMap(),
      where: 'id = ?',
      whereArgs: [training.id],
    );
  }

  Future<int> deleteTraining(int id) async {
    final db = await database;
    return db.delete(
      'trainings',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
