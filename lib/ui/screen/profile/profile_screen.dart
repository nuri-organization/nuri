import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/cubit/profile/profile_cubit.dart';
import 'package:nuri/cubit/profile/profile_state.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/test/profile_data.dart';
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
  void initState() {
    context.read<ProfileCubit>().getUserProfileData(profileModel: TestProfileData().data1, loadingStatus: LoadingStatus.success);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if(state.loadingStatus == LoadingStatus.success){
          return ListView(
            children: [
              UserInfo(
                profileModel: state.profileModel!,
              ),
              SizedBox(height: 40.h,),
              const ProfileEditBar(),
              SizedBox(height: 50.h,),
              PostGridView(
                profileModel: state.profileModel!,
              )
            ],
          );
        }
        else return Container();
      },
    );
  }
}
