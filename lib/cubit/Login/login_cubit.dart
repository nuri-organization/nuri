import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/login/login_model.dart';
import 'package:nuri/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginState());

  final LoginRepository loginRepository;

  void signUp({required String loginId, required String loginPassword}) async{
    var result = await loginRepository.signUp(loginId: loginId, loginPassword: loginPassword);
  }

}
