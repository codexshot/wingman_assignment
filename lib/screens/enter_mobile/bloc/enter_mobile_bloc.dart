import 'dart:async';

import 'package:assignment/networking/api_repository.dart';
import 'package:assignment/routes/app_pages.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/custom_snackbar.dart';

part 'enter_mobile_event.dart';

part 'enter_mobile_state.dart';

class EnterMobileBloc extends Bloc<EnterMobileEvent, EnterMobileState> {
  APIRepository apiRepo;

  EnterMobileBloc({required this.apiRepo})
      : super(EnterMobileState(
            isEnabled: false, isLoading: false, mobileNo: '')) {
    on<EnterMobileEvent>((event, emit) async {
      if (event is CheckMobileNumber) {
        if (event.phoneNumber.length == 10) {
          emit(state.copyWith(isEnabled: true, mobileNo: event.phoneNumber));
        } else {
          emit(state.copyWith(isEnabled: false, mobileNo: event.phoneNumber));
        }
      }
      if (event is SendOtp) {
        emit(state.copyWith(isLoading: true));
        await sendOtp(state.mobileNo);
      }
    });
  }

  //----------------------Send OTP--------------------------------------------

  sendOtp(phoneNo) async {
    try{
      await apiRepo
          .sendOTP(phoneNo: phoneNo)
          .then((value) => value.when(success: (success) {
        if (success!.status!) {
          Get.toNamed(Routes.ENTER_OTP_SCREEN,
              arguments: [success.requestId!]);
        } else {
          throw Exception('Something Went Wrong!!!');
        }
      }, failure: (failure) {
      throw Exception('Something Went Wrong!!!');
      }));
    }catch(e){
      showAppSnackBar(e);
    }


    emit(state.copyWith(isLoading: false));
  }
}
