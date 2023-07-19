import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/bloc/profile/profile_bloc.dart';
import 'package:nuri/bloc/profile/profile_event.dart';
import 'package:nuri/bloc/profile/profile_state.dart';
import 'package:nuri/ui/screen/profile/widget/post_grid_view.dart';
import 'package:nuri/ui/screen/profile/widget/profile_edit_bar.dart';
import 'package:nuri/ui/screen/profile/widget/user_info.dart';

class NuriProfileScreen extends StatefulWidget {
  const NuriProfileScreen({super.key});

  @override
  State<NuriProfileScreen> createState() => _NuriProfileScreenState();

}

class _NuriProfileScreenState extends State<NuriProfileScreen> {
  // late ProfileBloc _profileBloc;
  @override
  void initState() {
    // _profileBloc = BlocProvider.of<ProfileBloc>(context);
    // _profileBloc.add(ProfileLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ListView(
          children: [
            UserInfo(
              profileModel: state.profileModel,
            ),
            SizedBox(height: 40.h,),
            ProfileEditBar(),
            SizedBox(height: 50.h,),
            PostGridView(
              profileModel: state.profileModel,
            )
          ],
        );
      },
    );
  }
}
