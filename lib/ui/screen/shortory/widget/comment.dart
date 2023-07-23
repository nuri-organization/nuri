import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/data/model/post/comment/comment_model.dart';
import 'package:nuri/data/model/post/comment/replies_model.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

class Comment extends StatefulWidget {
  Comment({super.key, required this.commentModel});

  CommentModel commentModel;

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {

  bool more = false;

  void _moreViewReplies(){
    setState(() {
      more ? more = false : more = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(userInfo: widget.commentModel.userInfo,timeStamp: widget.commentModel.commentTime,),
        SizedBox(height: 5.h,),
        _CommentContent(text: widget.commentModel.content),
        SizedBox(height: 5.h,),
        more ? Padding(
            padding: EdgeInsets.only(left: 30.sp),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.commentModel.replies.length,
              itemBuilder: (context, index) {
                return CommentReplies(repliesModel: widget.commentModel.replies[index]);
              },
            )
        ) : SizedBox(),
        TextButton(
            onPressed: (){
              _moreViewReplies();
            }, 
            child: more ? Text("줄이기") : Text("더보기")
        ),
        Container(height: 0.1,width: double.infinity,color: Colors.black,),
        SizedBox(height: 5.h,),
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
        UserInfo(userInfo: repliesModel.userInfo, timeStamp: repliesModel.commentTime,),
        SizedBox(height: 5.h,),
        _CommentContent(text: repliesModel.content),
        SizedBox(height: 5.h,),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  UserInfo({super.key, required this.userInfo, required this.timeStamp});

  UserInfoModel userInfo;
  String timeStamp;

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
        SizedBox(width: 5.w,),
        Text(userInfo.userName),
        SizedBox(width: 5.w,),
        Text(timeStamp,style: TextStyle(fontSize: 10.sp, color: Colors.lightGreen),)
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
