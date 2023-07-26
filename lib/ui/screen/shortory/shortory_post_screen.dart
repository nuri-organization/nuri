import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/scaffold.dart';

class ShortoryPostScreen extends StatefulWidget {
  const ShortoryPostScreen({super.key});

  @override
  State<ShortoryPostScreen> createState() => _ShortoryPostScreenState();
}

class _ShortoryPostScreenState extends State<ShortoryPostScreen> {
  String title = "";
  List<XFile>? _images;
  List<String> story = List.filled(10, "");
  // List<String>? story;
  List<String>? byte;

  final ImagePicker picker = ImagePicker();

  Future getImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _images = pickedFiles;
      });
    }
  }

  Future getContent(int index, String content) async{
    setState(() {
      story[index] = content;
    });
  }

  Future getImage(int index) async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images![index] = pickedFile;
      });
    }
  }

  Future _getBytes(imageUrl) async {
    final Uint8List bytes = await File(imageUrl).readAsBytes();
    final val = base64Encode(bytes).toString();
    // byte = val;
    print(byte);
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: "새로운 게시글 만들기",
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _GetTextField(
                  title: "제목",
                  labelHint: "제목을 입력해주세요",
                  content: (value) {
                    setState(() {
                      title = value;
                    });
                  }),
              SizedBox(height: 10.h,),
              _GetTextField(
                  title: "내용",
                  labelHint: "내용을 작성해주세요",
                  content: (value) {
                    setState(() {
                      title = value;
                    });
                  }),
              SizedBox(height: 10.h,),
              _images != null ?
              SizedBox(
                height: 350.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _ProfileImage(
                    onTap: (content,index) {
                        // getImage(index);
                        getContent(index, content);
                    },
                    image: _images,
                  ),
                ),
              ) : SizedBox(),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                        getImages();
                    },
                    child: Container(width: 100, height: 30, color: Constants.theme4, child: Center(child: Text("사진 추가하기"),),),
                  ),
                ],
              ),

              SizedBox(height: 100.h,),
              InkWell(
                onTap: (){
                },
                child: Container(width: 100, height: 30, color: Constants.theme4, child: Center(child: Text("업로드 하기"),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GetTextField extends StatelessWidget {
  _GetTextField(
      {super.key,
      required this.title,
      required this.labelHint,
      required this.content});

  String title;
  String labelHint;
  Function(String)? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
            child: TextField(
              onChanged: content,
              decoration: InputDecoration(labelText: labelHint),
        ))
      ],
    );
  }
}

class _ProfileImage extends StatefulWidget {
  _ProfileImage({super.key, required this.onTap, this.image});

  Function(String,int)? onTap;
  List<XFile>? image;

  @override
  State<_ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<_ProfileImage> {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        _Image(
            shortory: widget.image,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}

class _Image extends StatefulWidget {
  _Image({super.key, required this.shortory,required this.onTap});

  List<XFile>? shortory;
  Function(String, int)? onTap;


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
          height: 350.h,
          child: PageView.builder(
              itemCount: widget.shortory != null ? widget.shortory!.length : 0,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    slider(widget.shortory,pagePosition),
                    // InkWell(
                    //   child: slider(widget.shortory,pagePosition),
                    //   onTap: widget.onTap(pagePosition),
                    // ),
                    SizedBox(
                        width: 260.w ,
                        child: _GetTextField(
                            title: "게시글에 이여기를 만들어보세요",
                            labelHint: "이여기를 작성해주세요",
                            content: (value){
                              widget.onTap!(value,pagePosition);
                            }
                            )
                    )

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
    height: 250.h,
    width: 250.w,
    duration: const Duration(milliseconds: 500),
    child:Center(child: Image.file(File(images[pagePosition].path), fit: BoxFit.fill)),
  );
}