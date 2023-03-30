part of 'enter_otp_bloc.dart';


class EnterOtpState extends Equatable {

  final bool isLoading;
  final bool isEnabled;

  const EnterOtpState(
      {required this.isEnabled,
        required this.isLoading,
      });

  EnterOtpState copyWith({
    String? mobileNo,
    bool? isLoading,
    bool? isEnabled,
  }) {
    return EnterOtpState(

      isLoading: isLoading ?? this.isLoading,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  List<Object> get props => [isEnabled, isLoading];


}


