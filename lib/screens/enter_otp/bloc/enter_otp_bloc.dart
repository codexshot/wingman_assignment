import 'dart:async';

import 'package:assignment/custom_widgets/custom_snackbar.dart';
import 'package:assignment/networking/api_repository.dart';
import 'package:assignment/routes/app_pages.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../networking/TokenHandler.dart';

part 'enter_otp_event.dart';

part 'enter_otp_state.dart';

class EnterOtpBloc extends Bloc<EnterOtpEvent, EnterOtpState> {
  final APIRepository apiRepo;

  EnterOtpBloc({required this.apiRepo})
      : super(EnterOtpState(isEnabled: false, isLoading: false)) {
    on<EnterOtpEvent>((event, emit) async {
      if (event is CheckPinCodeField) {
        if (event.pin.length == 6) {
          emit(state.copyWith(isEnabled: true));
        } else {
          emit(state.copyWith(isEnabled: false));
        }
      }
      if (event is VerifyOtpEvent) {
        emit(state.copyWith(isLoading: true));
        await verifyEnteredOTP(event.requestId, event.pin);
      }
    });
  }

  verifyEnteredOTP(req_id, pin) async {
    try {
      await apiRepo
          .verifyOTP(req_id: req_id, pin: pin)
          .then((value) => value.when(success: (success) {
                if (success!.status!) {
                  saveJwtToken(success.jwt!);
                  if (success.profileExists!) {
                    Get.offAllNamed(
                      Routes.HOME_SCREEN,
                    );
                  } else {
                    Get.offAllNamed(
                      Routes.WELCOME_SCREEN,
                    );
                  }
                } else {
                  showAppSnackBar(success.response!);
                }
              }, failure: (failure) {
                throw Exception('Something Went Wrong!!!');
              }));
    } catch (e) {
      showAppSnackBar(e);
    }
    emit(state.copyWith(isLoading: false));
  }
}
