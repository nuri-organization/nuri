import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/fcm_setting.dart';
import 'package:nuri/cubit/profile/profile_cubit.dart';
import 'package:nuri/cubit/profile/profile_state.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/data/model/profile/profile_model.dart';
import 'package:nuri/data/remote/push_alarm/notification_api.dart';
import 'package:nuri/ui/screen/error_screen.dart';
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

    super.initState();
  }

  @override
  void didChangeDependencies() async{
    ProfileModel? data = await context.read<ProfileCubit>().getLocalData();


    if(data == null){
      // ignore: use_build_context_synchronously
      context.read<ProfileCubit>().getUserProfileData();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
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
        if(state.loadingStatus == LoadingStatus.loading){
          return const CircularProgressIndicator();
        }
        if(state.loadingStatus == LoadingStatus.fail){
          return const ErrorScreen();
        }
        return Container();
      },
    );
  }
}
