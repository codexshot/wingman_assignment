import 'package:assignment/screens/enter_mobile/bloc/enter_mobile_bloc.dart';
import 'package:assignment/screens/enter_mobile/views/enter_mobile_screen.dart';
import 'package:assignment/screens/enter_otp/bloc/enter_otp_bloc.dart';
import 'package:assignment/screens/enter_otp/views/enter_otp_screen.dart';
import 'package:assignment/screens/onboarding/bloc/welcome_screen_bloc.dart';
import 'package:assignment/screens/onboarding/views/welcome_screen.dart';
import 'package:assignment/screens/splash/bloc/splash_cubit.dart';
import 'package:assignment/screens/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../networking/api_repository.dart';

class AppProvider {
  static final AppProvider _singleton = AppProvider._internal();

  factory AppProvider() {
    return _singleton;
  }

  AppProvider._internal();

  getProviderList() {
    return app_providers;
  }

  var app_providers = <BlocProvider>[
    BlocProvider<SplashCubit>(
      create: (BuildContext context) {
        return SplashCubit();
      },
      child: SplashScreen(),
    ),
    BlocProvider<EnterMobileBloc>(
      create: (BuildContext context) {
        return EnterMobileBloc(apiRepo: APIRepository(isTokenRequired: false));
      },
      child: EnterMobileScreen(),
    ),
    BlocProvider<EnterOtpBloc>(
      create: (BuildContext context) {
        return EnterOtpBloc(apiRepo: APIRepository(isTokenRequired: false));
      },
      child: EnterOtpScreen(),
    ),
    BlocProvider<WelcomeScreenBloc>(
      create: (BuildContext context) {
        return WelcomeScreenBloc(apiRepo: APIRepository(isTokenRequired: true));
      },
      child: WelcomeScreen(),
    ),
  ];
}
