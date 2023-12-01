import 'package:flutter/material.dart';
import 'views/login_screen.dart';
import 'views/profile.dart';
import 'utils/session_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintess App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _isLoggedIn = await SessionManager.isLoggedIn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? const Profile() : const LoginScreen();
  }
}
