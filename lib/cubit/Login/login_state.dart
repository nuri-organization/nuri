part of 'login_cubit.dart';

class LoginState extends Equatable {

  LoginState({this.loginStatus = LoginStatus.before, this.loginModel});

  LoginModel? loginModel;
  LoginStatus loginStatus;

  @override
  List<Object?> get props => [loginStatus, loginModel];
}
