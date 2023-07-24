import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/profile/profile_cubit.dart';
import 'package:nuri/data/model/profile/profile_model.dart';

class ProfileInputScreen extends StatefulWidget {
  const ProfileInputScreen({super.key});

  @override
  State<ProfileInputScreen> createState() => _ProfileInputScreenState();
}

class _ProfileInputScreenState extends State<ProfileInputScreen> {
  ProfileModel? profileModel;

  XFile? _image;
  Int8List? _bytes;

  String userName = "";
  String? introduce;
  String? bestTravel;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if(pickedFile != null){
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  void _getBytes(imageUrl) async {
    final ByteData data =
    await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl);
    setState(() {
      _bytes = data.buffer.asInt8List();
      print(_bytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: "프로필 입력",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h,),
          Center(
              child: _ProfileImage(
                onTap: (){
                  setState(() {
                    getImage(ImageSource.gallery);
                    _getBytes(_image!.path);
                  });
                },
              )
          ),
          const Text("프로필 이미지"),
          _GetTextField(
              title: "이름을 정해주세요",
              labelHint: "이름",
              content: (value){
                userName = value!;
                // profileModel = ProfileModel(userName: value!);
              }
          ),
          SizedBox(height: 10.h,),
          _GetTextField(
              title: "간단한 자기소개를 입력해주세요",
              labelHint: "자기소개",
              content: (value){
                introduce = value!;
                // profileModel = ProfileModel(introduce: value);
              }
          ),
          SizedBox(height: 10.h,),
          _GetTextField(
              title: "지금까지 경험해본 가장 좋았던 장소를 입력해주세요",
              labelHint: "여행지 이름",
              content: (value){
                bestTravel = value;
                // profileModel = ProfileModel(bestTravel: value);
              }
          ),
          SizedBox(height: 150.h,),
          _LoginButton(
            userName: userName,
            introduce: introduce,
            bestTravel: bestTravel,
          )
        ],
      ),
    );
  }
}

class _ProfileImage extends StatefulWidget {
  _ProfileImage({super.key, required this.onTap, this.image});
  void Function() onTap;
  XFile? image;

  @override
  State<_ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<_ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 100.w,
        width: 100.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.image != null ? null : Colors.grey,
        ),
        child: widget.image != null
            ? ClipOval(
            child: widget.image != null ? Image.file(File(widget.image!.path),fit: BoxFit.fill,) : null)
            : Icon(
          Icons.person,
          size: 60.sp,
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
  void Function(String?) content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
            child: TextField(
              onChanged: content,
              decoration: InputDecoration(labelText: labelHint),
            ))
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  _LoginButton({super.key, required this.userName, this.bestTravel, this.introduce});


  String userName;
  String? introduce;
  String? bestTravel;


@override
Widget build(BuildContext context) {
  return Container(
    height: 30.h,
    width: 100.w,
    color: Constants.theme4,
    child: InkWell(
        onTap: () {
          context.read<ProfileCubit>().setProfileData(userName: userName, introduce: introduce, bestTravel: bestTravel);
        },
        child: const Center(child: Text("완료"))),
  );
}
}

