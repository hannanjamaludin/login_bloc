import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';
import 'package:login_bloc/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            const SizedBox(
              height: 25.0,
            ),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error?.toString(),
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error?.toString(),
            ),
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey; // Disabled background color
                }
                return Colors.blue; // Enabled background color
              }),
              foregroundColor:
                  WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.black38; // Disabled text color
                }
                return Colors.white; // Enabled text color
              }),
              shape: const WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            onPressed: snapshot.hasData
                ? () {
                    print('Hi there!');
                  }
                : null,
            child: const Text('Login'),
          );
        });
  }
}
