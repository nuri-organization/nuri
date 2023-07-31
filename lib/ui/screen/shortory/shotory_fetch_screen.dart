import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/shortory/post/shortory_post_cubit.dart';
import 'package:nuri/data/model/post/post_model.dart';

class ShotoryFetchScreen extends StatefulWidget {
  PostModel postModel;
  ShotoryFetchScreen({super.key,required this.postModel});

  @override
  State<ShotoryFetchScreen> createState() => _ShotoryFetchScreenState();
}

class _ShotoryFetchScreenState extends State<ShotoryFetchScreen> {

  String title = "";
  String content = "";
  List<XFile>? _images;
  List<String> _networkImages = List.filled(10, "");

  List<String> story = List.filled(10, "");
  List<String> byte = List.filled(10, "");

  List<ShortoryModel> shortoryModel = [];

  final ImagePicker picker = ImagePicker();

  TextEditingController? _textEditingController = TextEditingController();

  setData(){
    title = widget.postModel.title;
    content = widget.postModel.content;

    // print(widget.postModel.shotory[1]);

    for(int i = 0 ; i <= widget.postModel.shotory.length -1; i ++){

      _networkImages[i] = widget.postModel.shotory[i].url;
      print(_networkImages);
      story[i] = widget.postModel.shotory[i].content;
    }
  }

  Future getImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _images = pickedFiles;
        _setData();
      });
    }
  }

  Future getContent(int index, String content) async{
    setState(() {
      story[index] = content;
    });
    print(story);
  }

  Future getImage(int index) async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images![index] = pickedFile;
      });
    }
  }

  Future _getBytes(imageUrl, int index) async {
    final Uint8List bytes = await File(imageUrl).readAsBytes();
    final String val = await base64Encode(bytes).toString();

    setState(() {
      byte[index] = val;
    });
  }

  void _setData() {

    for(int i = 0; i <= _images!.length -1; i++){
      print("gelli");
      _getBytes(_images![i].path, i);
      print(i);
    }

  }

  Future _setData2() async{
    for(int i = 0; i <= _images!.length -1; i++){
      shortoryModel.add(ShortoryModel(url: byte[i],content: story[i]));
    }
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height: 10.h,),
              TextField(
                controller: _textEditingController = TextEditingController(text: title),
                onChanged: (value){
                  final TextSelection previousCursorPos = _textEditingController!.selection;
                  _textEditingController!.selection = previousCursorPos;
                  title = value;
                },
                decoration: const InputDecoration(labelText: "제목을 작성해주세요"),
              ),
              TextField(
                controller: _textEditingController = TextEditingController(text: content),
                onChanged: (value){
                  final TextSelection previousCursorPos = _textEditingController!.selection;
                  _textEditingController!.selection = previousCursorPos;
                  content = value;
                },
                decoration: const InputDecoration(labelText: "내용을 작성해주세요"),
              ),
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
                    historyContent: _networkImages,
                    historyUrl: story,
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
                onTap: () async{
                  print(title);
                  await _setData2().then((value) => _setData2().then((value) => context.read<ShortoryPostCubit>().fetchShortoryPostInfo(shortoryModel: shortoryModel,title: title,content: content)));

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
        required this.content,
      });

  String title;
  String labelHint;
  Function(String)? content;


  TextEditingController? _textEditingController = TextEditingController();

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
  _ProfileImage({super.key, required this.onTap, this.image,this.historyContent, this.historyUrl});

  Function(String,int)? onTap;
  List<XFile>? image;
  List<String>? historyUrl;
  List<String>? historyContent;

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
          historyContent: widget.historyContent,
          historyUrl: widget.historyUrl,
        ),
      ],
    );
  }
}

class _Image extends StatefulWidget {
  _Image({super.key, required this.shortory,required this.onTap, this.historyUrl, this.historyContent});

  List<XFile>? shortory;
  Function(String, int)? onTap;
  List<String>? historyUrl;
  List<String>? historyContent;


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

  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // widget.onTap!(widget.content, activePage);
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
                    ),
                    TextField(
                      controller: _textEditingController = TextEditingController(text: widget.historyContent![pagePosition]),
                      onChanged: (value){
                        final TextSelection previousCursorPos = _textEditingController!.selection;
                        _textEditingController!.selection = previousCursorPos;
                        widget.historyContent![pagePosition] = value;
                      },
                      decoration: const InputDecoration(labelText: "내용을 작성해주세요"),
                    ),

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