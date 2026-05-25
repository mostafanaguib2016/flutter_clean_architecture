import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/login/login_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/register/register_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/main/main_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/onboarding/onboarding_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/splash_screen.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";

}

class RouteGenerator{

  static Route<dynamic> getRoute(RouteSettings settings){

    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=>const OnboardingScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=>const MainScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      default:
        return unDefinedRoute();
    }



  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(title: const Text(AppStrings.noRouteFound),),
      body: const Center(child: Text(AppStrings.noRouteFound),),
    ));
  }

}