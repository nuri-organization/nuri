import 'package:nuri/data/remote/login/login_api.dart';

abstract class LoginRepository{
  Future signUp({required String loginId, required String loginPassword});
  Future signIn({required String loginId, required String loginPassword});
}

class LoginRepositoryImpl extends LoginRepository{

  LoginApi api;
  LoginRepositoryImpl(this.api);

  @override
  Future signIn({required String loginId, required String loginPassword}) async{
    var result = await api.signIn(loginPassword: loginPassword,loginId: loginId);

    return result;
  }

  @override
  Future signUp({required String loginId, required String loginPassword}) async{
    var result = await api.signUp(loginPassword: loginPassword, loginId:  loginId);

    return result;
  }

}