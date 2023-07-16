import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/ui/screen/profile/widget/post_grid_view.dart';
import 'package:nuri/ui/screen/profile/widget/profile_edit_bar.dart';
import 'package:nuri/ui/screen/profile/widget/user_info.dart';

class NuriProfileScreen extends StatefulWidget {
  const NuriProfileScreen({super.key});

  @override
  State<NuriProfileScreen> createState() => _NuriProfileScreenState();
}

class _NuriProfileScreenState extends State<NuriProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          UserInfo(),
          SizedBox(height: 40.h,),
          ProfileEditBar(),
          SizedBox(height: 50.h,),
          PostGridView()
        ],
    );
  }
}
