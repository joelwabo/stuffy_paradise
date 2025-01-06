import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuffy_paradise/injection.dart';
import '../database/sql_database_service.dart';
import '../provider/user_session_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final UserSessionProvider session = getIt();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text;
                final password = _passwordController.text;

                await session.login(username, password);
                if (session.currentUser != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid username or password")),
                  );
                }
              },
              child: Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}
