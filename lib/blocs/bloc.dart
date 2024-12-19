import 'dart:async';

import 'package:login_bloc/blocs/validators.dart';

// implement mixin class
class Bloc with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}

// declare an instance of bloc so that the entire system will share the same bloc instance, thus share the same data across the app (only for small app)
final bloc = Bloc();
