import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/Login/login_cubit.dart';
import 'package:nuri/data/model/login/login_model.dart';

class EmailInfoScreen extends StatefulWidget {
  const EmailInfoScreen({super.key});

  @override
  State<EmailInfoScreen> createState() => _EmailInfoScreenState();
}

class _EmailInfoScreenState extends State<EmailInfoScreen> {
  String loginId = "";
  String loginPassword = "";

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: "로그인",
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
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
              )
            ],
          );
        },
      ),
    );
  }
}

class _GetTextField extends StatelessWidget {
  _GetTextField({super.key,
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
  _LoginButton({super.key, required this.loginPassword, required this.loginId});

  String loginId;
  String loginPassword;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      color: Constants.theme4,
      child: InkWell(
          onTap: () {
            print(loginId);
            print(loginPassword);
            context.read<LoginCubit>().signUp(loginId: loginId, loginPassword: loginPassword);
          },
          child: const Center(
              child: Text("로그인 하기")
          )
      ),
    );
  }
}
