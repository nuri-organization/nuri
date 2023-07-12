import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditBar extends StatelessWidget {
  const ProfileEditBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProfileEditButton()
      ],
    );
  }
}

class _ProfileEditButton extends StatelessWidget {
  const _ProfileEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 100.w,
      color: Colors.grey,
      child: Center(child: Text("프로필 수정", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),)),
    );
  }
}

