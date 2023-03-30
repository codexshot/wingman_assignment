import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  //==================Navigation to Next Screen=============
  void navigate() {
    Get.toNamed(Routes.ENTER_MOBILE_SCREEN);
  }
}
