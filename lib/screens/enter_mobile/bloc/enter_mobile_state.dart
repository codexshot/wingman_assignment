part of 'enter_mobile_bloc.dart';

class EnterMobileState extends Equatable {
  final String mobileNo;
  final bool isLoading;
  final bool isEnabled;

  const EnterMobileState(
      {required this.isEnabled,
      required this.isLoading,
      required this.mobileNo});

  EnterMobileState copyWith({
    String? mobileNo,
    bool? isLoading,
    bool? isEnabled,
  }) {
    return EnterMobileState(
      mobileNo: mobileNo ?? this.mobileNo,
      isLoading: isLoading ?? this.isLoading,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  List<Object> get props => [isEnabled, isLoading, mobileNo];
}
