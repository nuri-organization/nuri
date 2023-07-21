import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/data/model/post/post_model.dart';

class Post extends StatelessWidget {
  Post({super.key,required this.postModel});

  List<PostModel> postModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: postModel.length,
      itemBuilder: (context, index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserInfo(
              imageURL: postModel[index].userInfo.userProfile,
              userName: postModel[index].userInfo.userName,
            ),
            SizedBox(
              height: 5.h,
            ),
            _Image(
                shortory: postModel[index].shortory
            ),
            _StateBar(
              isLoved: postModel[index].liked,
            ),
            _Contents(
              contents: postModel[index].content,
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
      },
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

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      return SizedBox(
        width: 350.w,
        height: 250.h,
        child: widget,
      );
    },
    child: Image.network(images[pagePosition],fit: BoxFit.cover,),
  );
}


class _StateBar extends StatefulWidget {
  _StateBar({super.key, required this.isLoved});

  bool isLoved = false;

  @override
  State<_StateBar> createState() => _StateBarState();
}

class _StateBarState extends State<_StateBar> {
  _changeFavoriteState() {
    setState(() {
      widget.isLoved ? widget.isLoved = false : widget.isLoved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: _changeFavoriteState,
                icon: Icon(Icons.favorite,color: widget.isLoved ? Colors.pinkAccent : Colors.black,)
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu))
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
