import 'dart:async';

import 'package:login_bloc/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

// implement mixin class
class Bloc with Validators {
  // final _email = StreamController<
  //     String>.broadcast(); // declare broadcast, so that stream can be listened more than once
  // final _password = StreamController<String>.broadcast();

  // convert controller into subject
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print("Email: $validEmail");
    print("Password: $validPassword");
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

// // declare an instance of bloc so that the entire system will share the same bloc instance, thus share the same data across the app (only for small app)
// final bloc = Bloc();
