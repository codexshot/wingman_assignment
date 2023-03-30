part of 'enter_otp_bloc.dart';

@immutable
abstract class EnterOtpEvent extends Equatable {}

class CheckPinCodeField extends EnterOtpEvent {
  final String pin;

  CheckPinCodeField(this.pin);

  @override
  List<Object?> get props => [pin];
}

class VerifyOtpEvent extends EnterOtpEvent {
  final String pin;
  final String requestId;

  VerifyOtpEvent(this.pin, this.requestId);

  @override
  List<Object?> get props => [pin, requestId];
}
