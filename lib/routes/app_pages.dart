import 'package:assignment/screens/enter_mobile/views/enter_mobile_screen.dart';
import 'package:assignment/screens/enter_otp/views/enter_otp_screen.dart';
import 'package:assignment/screens/home/views/home_screen.dart';
import 'package:assignment/screens/onboarding/views/welcome_screen.dart';
import 'package:assignment/screens/splash/views/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = handleSplashScreen();

  static handleSplashScreen() {
    return Routes.SPLASH_SCREEN;
  }

  static const Transition _customTransition = Transition.noTransition;
  static const Duration _pageTransactions = Duration(milliseconds: 400);

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
      transition: _customTransition,
      transitionDuration: _pageTransactions,
    ),
    GetPage(
      name: _Paths.ENTER_MOBILE_SCREEN,
      page: () => const EnterMobileScreen(),
      transition: _customTransition,
      transitionDuration: _pageTransactions,
    ),
    GetPage(
      name: _Paths.ENTER_OTP_SCREEN,
      page: () =>  EnterOtpScreen(),
      transition: _customTransition,
      transitionDuration: _pageTransactions,
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreen(),
      transition: _customTransition,
      popGesture: false,
      transitionDuration: _pageTransactions,
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreen(),
      popGesture: false,
      transition: _customTransition,
      transitionDuration: _pageTransactions,
    ),
  ];
}
