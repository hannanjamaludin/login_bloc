import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/provider.dart';
import 'package:login_bloc/screens/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
