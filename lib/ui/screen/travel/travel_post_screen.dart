import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/travel/post/travel_post_cubit.dart';
import 'package:nuri/ui/common/nuri_date_picker.dart';
import 'package:nuri/ui/common/nuri_dialog.dart';

class TravelPostScreen extends StatefulWidget {
  const TravelPostScreen({super.key});

  @override
  State<TravelPostScreen> createState() => _TravelPostScreenState();
}

class _TravelPostScreenState extends State<TravelPostScreen> {

  String title = "";
  String content = "";
  int cost = 0;
  int maxPeople = 0;
  String? startDate;
  String? endDate;
  String travelPoint = "";
  List<String> travelPointList = [];

  Future _setTravelPoint()async{
     travelPointList = travelPoint.split(",");
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: "여행",
      child: SingleChildScrollView(
        child: Column(
          children: [
            _GetTextField(
                title: "여행 이름",
                labelHint: "여행 이름을 적어주세요",
                content: (value){
                  setState(() {
                    title = value;
                  });
                }
            ),
            SizedBox(height: 10.h,),
            _GetTextField(
                title: "여행 소개",
                labelHint: "여행을 소개해주세요",
                content: (value){
                  setState(() {
                    content = value;
                  });
                }
            ),
            SizedBox(height: 10.h,),
            _GetTextField(
                title: "예상 금액",
                labelHint: "예상하시는 금액을 적어주세요",
                content: (value){
                  setState(() {
                    cost = int.parse(value);
                  });
                }
            ),
            SizedBox(height: 10.h,),
            _GetTextField(
                title: "모집 인원",
                labelHint: "모집 인원을 적어주세요",
                content: (value){
                  setState(() {
                    maxPeople = int.parse(value);
                  });
                }
            ),
            SizedBox(height: 10.h,),
            _GetTextField(
                title: "주요 여행지",
                labelHint: ",을 사용하여 각각의 여행지를 6까지 입력해주세요!",
                content: (value){
                  setState(() {
                    travelPoint = value;
                  });
                }
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    startDate != null ? Text(startDate!) : const SizedBox(),
                    TextButton(
                        onPressed: () async{
                          DateTime? dateTime = await nuriDatePicker(context);
                          setState(() {
                            if(dateTime != null){
                              startDate = "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                            }
                          });
                        },
                        child: const Text("출발 날자")
                    ),
                  ],
                ),
                Column(
                  children: [
                    endDate != null ? Text(endDate!) : const SizedBox(),
                    TextButton(
                        onPressed: () async{
                          DateTime? dateTime = await nuriDatePicker(context);
                          setState(() {
                            if(dateTime != null){
                              endDate = "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                            }
                          });
                        },
                        child: const Text("여행 마지막날")
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80.h,),
            TextButton(
                onPressed: ()async{
                  await _setTravelPoint().then(
                          (value) => context.read<TravelPostCubit>().postTravelPostInfo(
                              title: title,
                              content: content,
                              mainTravel: travelPointList,
                              cost: cost,
                              startData: startDate!,
                              endDate: endDate!,
                              maxPeople: maxPeople
                          )
                  ).then((value) => Navigator.pop(context));
                },
                child: const Text("업로드 하기")
            )
          ],
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