import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/profile/profile_cubit.dart';

class ProfileFetchScreen extends StatefulWidget {
  const ProfileFetchScreen({super.key});

  @override
  State<ProfileFetchScreen> createState() => _ProfileFetchScreenState();
}

class _ProfileFetchScreenState extends State<ProfileFetchScreen> {
  XFile? _image;
  String? byte;

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

  Future _getBytes(imageUrl) async {

    final Uint8List bytes = await File(imageUrl).readAsBytes();
    final val = base64Encode(bytes).toString();
    byte = val;
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: "프로필 수정",
      child: Column(
        children: [
          _ProfileImage(
              image: _image,
              onTap: () {
                setState(() {
                  getImage(ImageSource.gallery).then((value){
                    _getBytes(_image!.path);
                  });
                  // _getBytes(_image!.path);
                });
              }),
          _GetTextField(
              title: "이름을 정해주세요",
              labelHint: "이름",
              content: (value) {
                setState(() {
                  userName = value!;
                });
                // profileModel = ProfileModel(userName: value!);
              }),
          SizedBox(
            height: 10.h,
          ),
          _GetTextField(
              title: "간단한 자기소개를 입력해주세요",
              labelHint: "자기소개",
              content: (value) {
                setState(() {
                  introduce = value!;
                });
                // profileModel = ProfileModel(introduce: value);
              }),
          SizedBox(
            height: 10.h,
          ),
          _GetTextField(
              title: "지금까지 경험해본 가장 좋았던 장소를 입력해주세요",
              labelHint: "여행지 이름",
              content: (value) {
                setState(() {
                  bestTravel = value;
                });
                // profileModel = ProfileModel(bestTravel: value);
              }),
          SizedBox(height: 150.h,),
          _FetchButton(userName: userName,introduce: introduce,bestTravel: bestTravel,image: byte,)
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  _ProfileImage({super.key, required this.onTap, this.image});

  void Function() onTap;
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.w,
        width: 100.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: image != null ? null : Colors.grey,
        ),
        child: image != null
            ? ClipOval(
                child: image != null
                    ? Image.file(
                        File(image!.path),
                        fit: BoxFit.fill,
                      )
                    : null)
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

class _FetchButton extends StatelessWidget {
  _FetchButton(
      {super.key, required this.userName, this.bestTravel, this.introduce, this.image});

  String userName;
  String? introduce;
  String? bestTravel;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      color: Constants.theme4,
      child: InkWell(
          onTap: () {
            context.read<ProfileCubit>().fetchProfileData(
              image: image,
                userName: userName,
                introduce: introduce,
                bestTravel: bestTravel);
            Navigator.pop(context);
          },
          child: const Center(child: Text("수정하기"))),
    );
  }
}
