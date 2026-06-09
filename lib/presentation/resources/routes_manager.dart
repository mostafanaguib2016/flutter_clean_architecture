import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/forget_password/view/forget_password_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/login/view/login_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/register/view/register_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/main/main_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/main/store_details/store_details_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/onboarding/view/onboarding_screen.dart';
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
        initRegisterModule();
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case Routes.forgetPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_)=>const ForgetPasswordScreen());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_)=>const MainScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=>const StoreDetailsScreen());
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