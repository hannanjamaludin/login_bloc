import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // constructor to take child argument and pass it to the super class (inheritedWidget)
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  // function for children widgets to access the bloc property from parent widget. This function will find the widget that have a bloc property in it and return it to the requested child widget
  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }
}
