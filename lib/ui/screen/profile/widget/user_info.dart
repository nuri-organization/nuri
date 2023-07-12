import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UserProfileImage(
          imageURL: "https://picsum.photos/250?image=9",
        ),
        Column(
          children: [
            _UserProfileDetailInfo(
              post: 1,
              follower: 22,
              following: 3,
            ),
            _UserSelfIntroduce(
              selfIntroduce: "hello every body this is nuri officer thank you user Nuri",
            )
          ],
        )
      ],
    );
  }
}

class _UserProfileImage extends StatelessWidget {
  _UserProfileImage({super.key, this.imageURL});
  String? imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.w,
      width: 120.w,
      color: imageURL != null ? null : Colors.grey,
      child: imageURL != null ? Image.network(imageURL!) : Icon(Icons.person, size: 72.sp,),
    );
  }
}

class _UserProfileDetailInfo extends StatelessWidget {
  _UserProfileDetailInfo({super.key, required this.follower, required this.following, required this.post});
  int post = 0;
  int following = 0;
  int follower = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35.h,
        width: 200.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("게시글",style: TextStyle(fontSize: 12.sp)),
                Text("팔로워",style: TextStyle(fontSize: 12.sp)),
                Text("팔로잉",style: TextStyle(fontSize: 12.sp)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$post",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold)),
                Text("$follower",style: TextStyle(fontSize: 12.sp, fontWeight:  FontWeight.bold)),
                Text("$following",style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        )
    );
  }
}

class _UserSelfIntroduce extends StatelessWidget {
  _UserSelfIntroduce({super.key, required this.selfIntroduce});
  String? selfIntroduce;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 200.w,
      child: Center(child: Text("$selfIntroduce",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),)),
    );
  }
}

