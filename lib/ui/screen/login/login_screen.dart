import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/ui/screen/login/email_info_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text("내 여행중 최고의 선택",style: TextStyle(fontSize: 28.sp),),
             Text("누리",style: TextStyle(fontSize: 34.sp, color: Constants.theme4),)
           ],
         ),
       ),
        SizedBox(height: 300.h,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailInfoScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h,width: 30.w, child: Image.asset("assets/icons/google_icon.png")),
              SizedBox(width: 5.w,),
              Text("이메일 계정을 사용하여 로그인하기",style: TextStyle(fontSize: 16.sp),)
            ],
          ),
        )
      ],
    );
  }
}
