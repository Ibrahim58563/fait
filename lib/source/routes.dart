import 'package:fait/source/views/chat_bot/views/chat_bot_view.dart';
import 'package:fait/source/views/home/views/home_view.dart';
import 'package:fait/source/views/onboarding/views/on_boarding_view.dart';
import 'package:fait/source/views/register/views/log_in_screen.dart';
import 'package:fait/source/views/register/views/sign_up_methods_screen.dart';
import 'package:fait/source/views/register/views/sign_up_screen.dart';
import 'package:fait/source/views/statistics_screens/views/after_login_screen.dart';
import 'package:fait/source/views/statistics_screens/views/daily_intake_screen.dart';
import 'package:fait/source/views/statistics_screens/views/sleep_tracker_screen.dart';
import 'package:fait/source/views/statistics_screens/views/steps_tracker_screen.dart';
import 'package:fait/source/views/statistics_screens/views/water_intake_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (context) => const Splash());
      // case 'onboarding':
      //   return MaterialPageRoute(builder: (context) => const OnBoarding());
      case '/main_onboarding_screen':
        return MaterialPageRoute(
            builder: (context) => const MainOnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => LogInScreen());
      // case 'signup':
      //   return MaterialPageRoute(builder: (context) => const SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeView());
      case '/on_boarding_screen':
        return MaterialPageRoute(
            builder: (context) => const SignUpMethodsScreen());
      case '/on_boarding_sign_up_screen':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case '/chat_bot':
        return MaterialPageRoute(builder: (context) => const ChatBotView());
      case '/daily_intake_screen':
        return MaterialPageRoute(
            builder: (context) => const DailyIntakeScreen());
      case '/water_intake_screen':
        return MaterialPageRoute(builder: (context) => WaterIntakeScreen());
      case '/sleep_tracker_screen':
        return MaterialPageRoute(
            builder: (context) => const SleepTrackerScreen());
      case '/after_login_screen':
        return MaterialPageRoute(
            builder: (context) => const AfterLoginScreen());
      case '/steps_tracker_screen':
        return MaterialPageRoute(
            builder: (context) => const StepsTrackerScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const SizedBox(
            child: Text("Error"),
          ),
        );
    }
  }
}
