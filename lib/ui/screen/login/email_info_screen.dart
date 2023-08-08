import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/Login/login_cubit.dart';
import 'package:nuri/ui/screen/profile/profile_input_screen.dart';
import 'package:nuri/ui/widget/nuri_dialog.dart';

class EmailInfoScreen extends StatefulWidget {
  const EmailInfoScreen({super.key});

  @override
  State<EmailInfoScreen> createState() => _EmailInfoScreenState();
}

class _EmailInfoScreenState extends State<EmailInfoScreen> {
  String loginId = "";
  String loginPassword = "";
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: isLogin ? "로그인" : "회원 가입",
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLogin = false;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          width: 170.w,
                          height: 20.h,
                          child: const Center(
                            child: Text("계정 생성"),
                          ),
                        ),
                        isLogin
                            ? const SizedBox()
                            : Container(
                                height: 3,
                                width: 70.w,
                                color: Constants.theme4,
                              )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLogin = true;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          width: 170.w,
                          height: 20.h,
                          child: const Center(
                            child: Text("로그인"),
                          ),
                        ),
                        isLogin
                            ? Container(
                                height: 3,
                                width: 70.w,
                                color: Constants.theme4,
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 13.h,
              ),
              _GetTextField(
                title: "이메일 아이디를 입력해주세요!",
                labelHint: "ID",
                content: (value) {
                  setState(() {
                    loginId = value;
                  });
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              _GetTextField(
                title: "이메일 비밀번호를 입력해주세요!",
                labelHint: "PASSWORD",
                content: (value) {
                  setState(() {
                    loginPassword = value;
                  });
                },
              ),
              SizedBox(
                height: 300.h,
              ),
              _LoginButton(
                loginId: loginId,
                loginPassword: loginPassword,
                isLogin: isLogin,
              )
            ],
          );
        },
      ),
    );
  }
}

class _GetTextField extends StatelessWidget {
  _GetTextField(
      {super.key,
      required this.title,
      required this.labelHint,
      required this.content});

  String title;
  String labelHint;
  void Function(String) content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
            child: TextField(
          onChanged: content,
          decoration: InputDecoration(labelText: labelHint),
        ))
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  _LoginButton(
      {super.key,
      required this.loginPassword,
      required this.loginId,
      required this.isLogin});

  String loginId;
  String loginPassword;
  bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      color: Constants.theme4,
      child: InkWell(
          onTap: () {
            isLogin
                ? context.read<LoginCubit>().signIn(loginId: loginId, loginPassword: loginPassword).then((value) {
                    if(!value){
                      nuriDialog(context, [Text("없는 계정입니다")]);
                    }
                    if(value){
                      Navigator.pop(context);
                    }
                }) : context.read<LoginCubit>().signUp(loginId: loginId, loginPassword: loginPassword);
            if(!isLogin) Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInputScreen()));
          },
          child: Center(child: Text(isLogin ? "로그인 하기" : "회원가입 하기"))),
    );
  }
}
