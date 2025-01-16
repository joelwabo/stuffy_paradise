import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stuffy_paradise/injection.dart';
import '../database/sql_database_service.dart';
import '../models/user.dart';

@lazySingleton
class UserSessionProvider extends ChangeNotifier {
  User? _currentUser;
  DateTime? _loginTime;
  final SqlDatabaseService dbService = getIt();

  User? get currentUser => _currentUser;
  DateTime? get loginTime => _loginTime;
  bool get isLoggedIn => _currentUser != null;

  Future<void> login(String username, String password) async {
    final user = await dbService.login(username, password);
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  String get loggedInDuration {
    if (_loginTime == null) return "Not logged in";
    final duration = DateTime.now().difference(_loginTime!);
    return "${duration.inMinutes} minutes";
  }
}
