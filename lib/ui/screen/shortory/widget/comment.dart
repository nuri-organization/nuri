import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/data/model/post/comment/comment_model.dart';
import 'package:nuri/data/model/post/comment/replies_model.dart';
import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

class Comment extends StatelessWidget {
  Comment({super.key, required this.commentModel});
  CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(userInfo: commentModel.userInfo),
        _CommentContent(text: commentModel.content),
        Padding(
          padding: EdgeInsets.only(left: 30.sp),
          child: CommentReplies(repliesModel: commentModel.replies[0]),
        )
      ],
    );
  }
}

class CommentReplies extends StatelessWidget {
  CommentReplies({super.key, required this.repliesModel});
  RepliesModel repliesModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(userInfo: repliesModel.userInfo),
        _CommentContent(text: repliesModel.content)
      ],
    );
  }
}


class UserInfo extends StatelessWidget {
  UserInfo({super.key, required this.userInfo});
  UserInfoModel userInfo;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30.w,
          width: 30.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: userInfo.userProfile != null ? null : Colors.grey,
          ),
          child: userInfo.userProfile != null
              ? ClipOval(
              child: Image.network(
                userInfo.userProfile!,
                fit: BoxFit.fill,
              ))
              : Icon(
            Icons.person,
            size: 24.sp,
          ),
        ),
        Text(userInfo.userName)
      ],
    );
  }
}

class _CommentContent extends StatelessWidget {
  _CommentContent({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}





