part of 'enter_mobile_bloc.dart';

abstract class EnterMobileEvent extends Equatable {
  const EnterMobileEvent();
}

class CheckMobileNumber extends EnterMobileEvent{

  final String phoneNumber;
  const CheckMobileNumber(this.phoneNumber);

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber];
}

class SendOtp extends EnterMobileEvent{


  const SendOtp();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
