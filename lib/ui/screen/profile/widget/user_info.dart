import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UserProfileImage(
          imageURL: "https://picsum.photos/250?image=9",
        ),
        SizedBox(
          width: 30.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserProfileDetailInfo(
              post: 1,
              follower: 2222,
              following: 3,
            ),
            _UserFavoriteTravel(
              favoriteTravel: "제주도",
            ),
            // _UserSelfIntroduce(
            //   selfIntroduce: "hello every body this is nuri officer thank you user Nuri",
            // )
          ],
        )
      ],
    );
  }
}

@immutable
class _UserProfileImage extends StatelessWidget {
  _UserProfileImage({super.key, this.imageURL});

  String? imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w,
      width: 100.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: imageURL != null ? null : Colors.grey,
      ),
      child: imageURL != null
          ? ClipOval(
              child: Image.network(
              imageURL!,
              fit: BoxFit.fill,
            ))
          : Icon(
              Icons.person,
              size: 72.sp,
            ),
    );
  }
}

@immutable
class _UserProfileDetailInfo extends StatelessWidget {
  _UserProfileDetailInfo(
      {super.key,
      required this.follower,
      required this.following,
      required this.post});

  int post = 0;
  int following = 0;
  int follower = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35.h,
        width: 200.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: Text("여행", style: TextStyle(fontSize: 12.sp))),
                SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: Text("팔로워", style: TextStyle(fontSize: 12.sp))),
                SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: Text("팔로잉", style: TextStyle(fontSize: 12.sp))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: Text("$post",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold))),
                SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: Text("$follower",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold))),
                SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: Text("$following",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ));
  }
}

@immutable
class _UserSelfIntroduce extends StatelessWidget {
  _UserSelfIntroduce({super.key, required this.selfIntroduce});

  String? selfIntroduce;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: 200.w,
      child: Center(
          child: Text(
        "$selfIntroduce",
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
      )),
    );
  }
}

@immutable
class _UserFavoriteTravel extends StatelessWidget {
  _UserFavoriteTravel({super.key, this.favoriteTravel});

  String? favoriteTravel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 200.w,
      child: Text(
        "최고의 여행지 : $favoriteTravel",
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}


