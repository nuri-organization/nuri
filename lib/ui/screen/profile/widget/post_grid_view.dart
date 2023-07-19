import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/data/model/profile/profile_model.dart';

class PostGridView extends StatelessWidget {
  PostGridView({super.key, required this.profileModel});

  ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            children: List.generate(profileModel.posts.length - 1, (index) {
              return Container(
                color: Colors.grey,
                child: Text("${profileModel.posts[index]?.postId}"),
              );
            }),
          ),
        ],
      ),
    );
  }
}
