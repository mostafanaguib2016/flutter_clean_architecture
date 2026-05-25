import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({super.key});

  // named constructor for avoiding reinitializing the default constructor and apply
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal(); // single instance or singleton

  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}