import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.green,
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}