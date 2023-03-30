part of 'welcome_screen_bloc.dart';

 class WelcomeScreenState extends Equatable {

  final bool isLoading;
  final bool isEnabled;

  const WelcomeScreenState(
      {required this.isEnabled,
        required this.isLoading,
      });

  WelcomeScreenState copyWith({
    String? mobileNo,
    bool? isLoading,
    bool? isEnabled,
  }) {
    return WelcomeScreenState(

      isLoading: isLoading ?? this.isLoading,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  List<Object> get props => [isEnabled, isLoading];

 }

