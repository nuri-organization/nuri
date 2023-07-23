import 'package:nuri/data/model/login/login_model.dart';
import 'package:nuri/data/remote/login/login_api.dart';

abstract class LoginRepository{
  Future<bool> signUp({required String loginId, required String loginPassword});
  Future<bool> signIn({required LoginModel loginModel});
}

class LoginRepositoryImpl extends LoginRepository{

  LoginApi api;
  LoginRepositoryImpl(this.api);

  @override
  Future<bool> signIn({required LoginModel loginModel}) async{
    final bool result = await api.signIn(loginModel: loginModel);

    return result;
  }

  @override
  Future<bool> signUp({required String loginId, required String loginPassword}) async{
    final bool result = await api.signUp(loginPassword: loginPassword, loginId:  loginId);

    return result;
  }

}