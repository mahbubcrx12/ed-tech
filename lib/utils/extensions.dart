import 'package:ed_tech/values/app_constants.dart';
import 'package:flutter/material.dart';

extension NavigationThroughString on String {
  Future<dynamic> pushName() async {
    return AppConstants.navigationKey.currentState?.pushNamed(
      this,
    );
  }
}

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  void showSnackBar(String? message, {bool isError = false}) =>
      ScaffoldMessenger.of(this)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message ?? ''),
          ),
        );
}
