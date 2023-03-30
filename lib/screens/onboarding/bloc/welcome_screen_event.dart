part of 'welcome_screen_bloc.dart';

abstract class WelcomeScreenEvent extends Equatable {
  const WelcomeScreenEvent();
}

class RegisterUserEvent extends WelcomeScreenEvent{

 final String email;
 final String name;
  RegisterUserEvent(this.email,this.name);

  @override
  List<Object?> get props =>[email,name];

}


