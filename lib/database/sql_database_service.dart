import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../models/client.dart';
import '../models/ride.dart';
import '../models/stuffy.dart';
import '../models/user.dart';

@lazySingleton
class SqlDatabaseService {
  late Database db;

  Future<void> init() async {
    final directory = Directory.current.path;
    final path = join(directory, 'app_database.db');
    print(path);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create client table
        await db.execute('''
          CREATE TABLE client (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            lastName TEXT,
            email TEXT,
            phone TEXT,
            createdAt TEXT
          )
        ''');

        // Create user table
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userName TEXT UNIQUE,
            password TEXT,
            isAdmin INTEGER,
            createdAt TEXT
          )
        ''');

        // Create stuffy table
        await db.execute('''
          CREATE TABLE stuffy (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            odometer REAL,
            createdAt TEXT
          )
        ''');

        // Create ride table
        await db.execute('''
          CREATE TABLE ride (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            clientId INTEGER,
            stuffyId INTEGER,
            userId INTEGER, 
            isComplete INTEGER,
            isPay INTEGER,
            cost DOUBLE,
            duration INTEGER,
            startTime TEXT,
            endTime TEXT,
            createdAt TEXT,
            FOREIGN KEY(clientId) REFERENCES client(id),
            FOREIGN KEY(stuffyId) REFERENCES stuffy(id),
            FOREIGN KEY(userId) REFERENCES user(id)
          )
        ''');
      },
    );
  }

  // Create a new Client
  Future<void> createClient(Client client) async {
    await db.insert(
      'client',
      {
        'firstName': client.firstName,
        'lastName': client.lastName,
        'email': client.email,
        'phone': client.phone,
        'createdAt': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update a Client
  Future<void> updateClient(Client client) async {
    await db.update(
      'client',
      {
        'firstName': client.firstName,
        'lastName': client.lastName,
        'email': client.email,
        'phone': client.phone,
      },
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }

  // Get a Client by ID
  Future<Client?> getClient(int id) async {
    final result = await db.query(
      'client',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      final row = result.first;
      return Client(
        id: row['id'] as int,
        firstName: row['firstName'] as String,
        lastName: row['lastName'] as String,
        email: row['email'] as String,
        phone: row['phone'] as String,
      );
    }
    return null; // Return null if not found
  }

  // Get all Clients
  Future<List<Client>> getClients() async {
    final result = await db.query('client');
    return result.map((row) {
      return Client(
        id: row['id'] as int,
        firstName: row['firstName'] as String,
        lastName: row['lastName'] as String,
        email: row['email'] as String?,
        phone: row['phone'] as String?,
      );
    }).toList();
  }

  // Create a new Ride
  Future<int> createRide(Ride ride, int userId) async {
    final id = await db.insert(
      'ride',
      {
        'clientId': ride.clientId,
        'stuffyId': ride.stuffyId,
        'userId': userId,
        'isComplete': ride.isComplete ? 1 : 0,
        'isPay': ride.isPay ? 1 : 0,
        'cost': ride.cost,
        'startTime': ride.startTime?.toIso8601String(),
        'createdAt': DateTime.now().toIso8601String(),
        'duration': ride.duration,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id; // Return the ID of the created ride
  }


  // Update a Ride
  Future<void> updateRide(Ride ride) async {
    await db.update(
      'ride',
      {
        'clientId': ride.clientId,
        'stuffyId': ride.stuffyId,
        'isComplete': ride.isComplete ? 1 : 0,
        'isPay': ride.isPay ? 1 : 0,
        'cost': ride.cost,
        'duration': ride.duration,
        'startTime': ride.startTime?.toIso8601String(),
        'endTime': ride.endTime?.toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [ride.id],
    );
  }

  // Get a Ride by ID
  Future<Ride?> getRide(int id) async {
    final result = await db.query(
      'ride',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      final row = result.first;
      return Ride(
        id: row['id'] as int,
        clientId: row['clientId'] as int,
        stuffyId: row['stuffyId'] as int,
        isComplete: (row['isComplete'] as int) == 1,
        startTime: DateTime.parse(row['startTime'] as String),
        cost: row['cost'] as double,
        duration: row['duration'] as int,
        endTime: row['endTime'] != null ? DateTime.parse(row['endTime'] as String) : null,
      );
    }
    return null; // Return null if not found
  }

  // Get all Rides with a startTime >= param date
  Future<List<Ride>> getRides({required bool isPay, required int userId}) async {
    final result = await db.query(
      'ride',
      where: 'isPay = ? AND userId = ?',
      whereArgs: [isPay ? 1 : 0, userId],
    );
    return result.map((row) {
      return Ride(
        id: row['id'] as int,
        clientId: row['clientId'] as int,
        stuffyId: row['stuffyId'] as int,
        isComplete: (row['isComplete'] as int) == 1,
        isPay: (row['isPay'] as int) == 1,
        cost: row['cost'] as double,
        duration: row['duration'] as int,
        startTime: DateTime.parse(row['startTime'] as String),
        endTime: row['endTime'] != null ? DateTime.parse(row['endTime'] as String) : null,
      );
    }).toList();
  }

  // Create a new Stuffy
  Future<void> createStuffy(Stuffy stuffy) async {
    await db.insert(
      'stuffy',
      {
        'name': stuffy.name,
        'odometer': stuffy.odometer,
        'createdAt': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update a Stuffy
  Future<void> updateStuffy(Stuffy stuffy) async {
    await db.update(
      'stuffy',
      {
        'name': stuffy.name,
        'odometer': stuffy.odometer,
      },
      where: 'id = ?',
      whereArgs: [stuffy.id],
    );
  }

  // Get a Stuffy by ID
  Future<Stuffy?> getStuffy(int id) async {
    final result = await db.query(
      'stuffy',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      final row = result.first;
      return Stuffy(
        id: row['id'] as int,
        name: row['name'] as String,
        odometer: row['odometer'] as double,
      );
    }
    return null; // Return null if not found
  }

  // Get all Stuffies
  Future<List<Stuffy>> getStuffies() async {
    final result = await db.query('stuffy');
    return result.map((row) {
      return Stuffy(
        id: row['id'] as int,
        name: row['name'] as String,
        odometer: row['odometer'] as double,
      );
    }).toList();
  }

  Future<void> createUser(User user) async {
    final hashedPassword = _hashPassword(user.userName); // Hash the password
    await db.insert(
      'user',
      {
        'userName': user.userName,
        'password': hashedPassword,
        'isAdmin': user.isAdmin ? 1 : 0,
        'createdAt': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> login(String userName, String password) async {
    final hashedPassword = _hashPassword(password);
    final result = await db.query(
      'user',
      where: 'userName = ? AND password = ?',
      whereArgs: [userName, hashedPassword],
    );
    if (result.isNotEmpty) {
      final row = result.first;
      return User(
        id: row['id'] as int,
        userName: row['userName'] as String,
        isAdmin: (row['isAdmin'] as int) == 1,
      );
    }
    return null;
  }

  Future<void> updateUser(int userId, {String? newUserName, String? newPassword}) async {
    final updates = <String, dynamic>{};
    if (newUserName != null) updates['userName'] = newUserName;
    if (newPassword != null) updates['password'] = _hashPassword(newPassword);
    if (updates.isNotEmpty) {
      await db.update(
        'user',
        updates,
        where: 'id = ?',
        whereArgs: [userId],
      );
    }
  }

  String _hashPassword(String password) {
    // Simple hashing for demonstration; use a library like crypto for stronger hashing
    return password;//password.split('').reversed.join();
  }
}
