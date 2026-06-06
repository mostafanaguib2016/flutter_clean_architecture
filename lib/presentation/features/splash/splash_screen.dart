import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/app_shared_preferences.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  final AppSharedPreferences _sharedPreferences = instance<AppSharedPreferences>();

  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext(){

    _sharedPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if(isUserLoggedIn){
        Navigator.pushReplacementNamed(context, Routes.mainRoute)
      }else{
        _sharedPreferences.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed) => {
          if(isOnBoardingScreenViewed){
            Navigator.pushReplacementNamed(context, Routes.loginRoute)
          }else{
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
          }
        })
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
