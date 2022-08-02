// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  static const mobileWidth = 600;
  final Widget loginPage;
  final Widget loginPageDesktop;

  const ResponsiveLayout(
      {required this.loginPage, required this.loginPageDesktop});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return loginPage;
      } else {
        return loginPageDesktop;
      }
    });
  }
}
