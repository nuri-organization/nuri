import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/data/model/login/login_model.dart';
import 'package:nuri/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginState());

  final LoginRepository loginRepository;

  void signUp({required String loginId, required String loginPassword}) async{
    var result = await loginRepository.signUp(loginId: loginId, loginPassword: loginPassword);

    LocalStorage().setUserIdToken(result)
        .then((value) => emit(LoginState(loginStatus: LoginStatus.finish)));
  }

  Future<bool> signIn({required String loginId, required String loginPassword}) async{
    var result = await loginRepository.signIn(loginId: loginId, loginPassword: loginPassword);

    if(result != ""){
      LocalStorage().setUserIdToken(result).then((value) => emit(LoginState(loginStatus: LoginStatus.finish)));
    }
    if(result == ""){
      return result;
    }
    return true;
  }

  void checkAutoLogin() async{
    var value = LocalStorage().getUserIdToken();
    if(value != ""){
      emit(LoginState(loginStatus: LoginStatus.finish));
    }
  }

}
