import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void pushTo(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacementNamed<T, TO>(String routeName,
      {Object? arguments}) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      predicate ?? (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }

  bool canPop() {
    return Navigator.canPop(this);
  }

  Object? getArguments() {
    final ModalRoute? modalRoute = ModalRoute.of(this);
    return modalRoute?.settings.arguments;
  }
}
