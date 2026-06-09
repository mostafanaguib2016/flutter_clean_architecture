import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text(AppStrings.stores),
    ));
  }
}
