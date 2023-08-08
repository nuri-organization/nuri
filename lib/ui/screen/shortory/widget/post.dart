import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/cubit/shortory/post/shortory_post_cubit.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/ui/screen/chat/chat_screen.dart';
import 'package:nuri/ui/screen/chat/model/chat_check_service.dart';
import 'package:nuri/ui/screen/profile/widget/profile_detail_screen.dart';
import 'package:nuri/ui/screen/shortory/shortory_comment.dart';
import 'package:nuri/ui/screen/shortory/shotory_fetch_screen.dart';
import 'package:nuri/ui/common/nuri_dialog.dart';

class Post extends StatelessWidget {
  Post({super.key,required this.postModel});

  PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserInfo(
              imageURL: postModel.userInfo.userProfile,
              userName: postModel.userInfo.userName,
            ),
            SizedBox(
              height: 5.h,
            ),
            _Image(
                shortory: postModel.shotory
            ),
            _StateBar(
              userId: postModel.userInfo.userId,
              isLoved: postModel.liked,
              title: postModel.title,
              postId: postModel.postId,
              userName: postModel.userInfo.userName,
              userProfile: postModel.userInfo.userProfile,
              postModel: postModel,
            ),
            _Contents(
              contents: postModel.content,
            ),
            SizedBox(height: 30.h,),
            Container(
              color: Colors.black,
              height: 0.1,
              width: 360.w,
            ),
            SizedBox(height: 30.h,)
          ],
        );
  }
}

class _UserInfo extends StatelessWidget {
  _UserInfo({super.key, this.imageURL, required this.userName});

  String? imageURL;
  String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30.w,
          width: 30.w,
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
                  size: 24.sp,
                ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(userName)
      ],
    );
  }
}

class _Image extends StatefulWidget {
  _Image({super.key, required this.shortory});

  List<ShortoryModel> shortory;

  @override
  State<_Image> createState() => _ImageState();
}

class _ImageState extends State<_Image> {
  late PageController _pageController;

  int activePage = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          width: 450.w,
          height: 250.h,
          child: PageView.builder(
              itemCount: widget.shortory.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Column(
                  children: [
                    slider(widget.shortory,pagePosition),
                    Text(widget.shortory[pagePosition].content)
                  ],
                );
              }),
        ),
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition) {
  return AnimatedContainer(
    height: 230.h,
    width: 250.w,
    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
    duration: const Duration(milliseconds: 500),
    child:Image.network(images[pagePosition].url,fit: BoxFit.cover,),
  );
}


class _StateBar extends StatefulWidget {
  _StateBar({super.key, required this.isLoved, required this.title, required this.postId, required this.userId,required this.userName,this.userProfile, required this.postModel});

  PostModel postModel;

  bool isLoved = false;
  int postId = 0;
  String userId;
  String? userProfile;
  String userName;
  String title;

  @override
  State<_StateBar> createState() => _StateBarState();
}

class _StateBarState extends State<_StateBar> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () async{
                  setState(() {
                      widget.isLoved ? widget.isLoved = false : widget.isLoved = true;
                    });
                   context.read<ShortoryPostCubit>().postLike(postId: widget.postId);
                },
                icon: Icon(
                  Icons.favorite,
                  color: widget.isLoved
                      ? Colors.pinkAccent
                      : Colors.black,
                )
            ),
            IconButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShortoryComment(
                        title: widget.title,
                        postId: widget.postId,
                      )
                  )
              );
            }, icon: const Icon(Icons.chat)),
          ],
        ),
        IconButton(onPressed: () async{
          await nuriDialog(context,[
            const Text("-----메뉴-----"),
            LocalStorage().getUserIdToken() == widget.userId ?
            TextButton(
                onPressed: (){

                  nuriDialog(context, const [
                    Text("이미지 처리 방식에 대해 기술적인 문제가 있습니다."),
                    Text("다음 버전에 돌아오도록 하겠습니다!"),
                    Text("불편을 드려 정말 죄송합니다.")
                  ]);

                  /// TODO : 다음버전에 추가
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => ShotoryFetchScreen(postModel: widget.postModel,)));
                }, child: const Text("수정 하기")) : const SizedBox(),
            TextButton(
                onPressed: () async{
                  context.read<ShortoryPostCubit>().postBookmark(postId: widget.postId);
                },
                child: const Text("북마크하기")),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileDetailScreen(userId: widget.userId,)));
                },
                child: const Text("프로필 보기")),
            TextButton(
                onPressed: () async{
                  ChatScreenArguments _chatArg = ChatScreenArguments(
                      peerId: widget.userId,
                      peerImageUrl: widget.userProfile,
                      peerNickname: widget.userName,
                      myNickname: LocalStorage().getName(),
                      chatRoomId: '',
                    isTravel: false
                  );
                  ChatCheckService().check(context, _chatArg).then((value) {
                    if (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(chatArg: _chatArg) ));
                    }
                  });
                }, child: const Text("채팅 하기")),
            TextButton(
                onPressed: (){

                }, child: const Text("신고하기",style: TextStyle(color: Colors.redAccent),)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  }, child: const Text("닫기"))
          ]);
        }, icon: const Icon(Icons.menu))
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  _Contents({super.key, this.contents});
  String? contents;

  @override
  Widget build(BuildContext context) {
    return Text(contents ?? "");
  }
}

