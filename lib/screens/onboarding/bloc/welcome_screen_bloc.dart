import 'dart:async';

import 'package:assignment/networking/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/custom_snackbar.dart';
import '../../../routes/app_pages.dart';

part 'welcome_screen_event.dart';

part 'welcome_screen_state.dart';

class WelcomeScreenBloc extends Bloc<WelcomeScreenEvent, WelcomeScreenState> {
  APIRepository apiRepo;

  WelcomeScreenBloc({required this.apiRepo})
      : super(WelcomeScreenState(isEnabled: false, isLoading: false)) {
    on<WelcomeScreenEvent>((event, emit) {
      if (event is RegisterUserEvent) {
        emit(state.copyWith(isLoading: true));
        registerUser(event.email, event.name);
      }
    });
  }

  registerUser(email, name) async {
    try {
      await apiRepo
          .registerUser(name: name, email: email)
          .then((value) => value.when(
              success: (success) {
                emit(state.copyWith(isLoading: false));
                if(success!.status!){
                  Get.offAllNamed(
                    Routes.HOME_SCREEN,
                  );
                }else{
                  throw Exception('Something Went Wrong!!!');
                }
              },
              failure: (failure) {
                throw Exception('Something Went Wrong!!!');
              }));
    } catch (e) {
      showAppSnackBar(e.toString());
      emit(state.copyWith(isLoading: false));
    }

  }
}
