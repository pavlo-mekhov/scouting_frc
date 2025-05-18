import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:scouting_frc/DataManagement/Objects/team_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();
  static Database? _database;

  factory LocalDatabase() => _instance;

  LocalDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    WidgetsFlutterBinding.ensureInitialized();

    return _database = await openDatabase(
      join(await getDatabasesPath(), 'scouting_database.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE IF NOT EXISTS teams ('
                'team_number INTEGER PRIMARY KEY, '
                'name TEXT, '
                'drivetrain TEXT)'
        );
        db.execute(
            'CREATE TABLE IF NOT EXISTS matches ('
                'match_number INTEGER PRIMARY KEY, '
                'team_number INTEGER, '
                'name TEXT, '
                'age INTEGER, '
                'FOREIGN KEY (team_number) REFERENCES teams (team_number))'
        );
      },
    );
  }

  static Future<void> insertTeam(TeamInfo team) async {
    final db = await _instance.database;
    await db.insert(
      'teams',
      team.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getAllTeams() async {
    final db = await _instance.database;
    return await db.query('teams');
  }

  static Future<String> getAllTeamsAsString() async {
    final db = await _instance.database;
    final List<Map<String, dynamic>> teams = await db.query('teams');

    return teams.map((team) => 'Team Number: ${team['team_number']}, Name: ${team['name']}').join('\n');
  }


  static Future<void> updateTeam(TeamInfo team) async {
    final db = await _instance.database;
    await db.update(
      'teams',
      team.toMap(),
      where: 'team_number = ?',
      whereArgs: [team.teamNumber],
    );
  }

  static Future<void> deleteTeam(int teamNumber) async {
    final db = await _instance.database;
    await db.delete(
      'teams',
      where: 'team_number = ?',
      whereArgs: [teamNumber],
    );
  }
}