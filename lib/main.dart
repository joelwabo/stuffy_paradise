import 'package:flutter/material.dart';
import 'package:stuffy_paradise/database/sql_database_service.dart';
import 'package:stuffy_paradise/provider/home_screen_provider.dart';
import 'injection.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'provider/user_session_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // Initialize the FFI database factory
  databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final SqlDatabaseService _dbService = getIt();
  await _dbService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<HomeScreenProvider>()),
        ChangeNotifierProvider(create: (_) => UserSessionProvider()),
      ],
      child: MaterialApp(
        title: 'Stuffy Paradise',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Consumer<UserSessionProvider>(
          builder: (context, session, _) {
            return session.isLoggedIn ? HomeScreen() : LoginScreen();
          },
        ),
      ),
    );
  }
}
