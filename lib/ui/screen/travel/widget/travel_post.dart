import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/data/model/travel/travel_post_model.dart';

class TravelPost extends StatefulWidget {
  TravelPost({super.key, required this.travelPostModel});

  List<TravelPostModel> travelPostModel;

  @override
  State<TravelPost> createState() => _TravelPostState();
}

class _TravelPostState extends State<TravelPost> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.travelPostModel.length,
        itemBuilder: (context, index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PostInfo(
                  imageURL: widget.travelPostModel[index].userInfo.userProfile,
                  name: widget.travelPostModel[index].userInfo.userName,
                  title: widget.travelPostModel[index].title,
                  applied: widget.travelPostModel[index].applied,
                  maxPeople: widget.travelPostModel[index].maxPeople,
                  people: widget.travelPostModel[index].currentPeople
              ),
              Row(
                children: [
                  Text("${widget.travelPostModel[index].startDate} ~ ${widget.travelPostModel[index].endDate}")
                ],
              ),
              Text(widget.travelPostModel[index].content),
              SizedBox(height: 10.h,),
              const Text("주요 여행지"),
              // _ImportantTravel(travelName: widget.travelPostModel[index].mainTravel),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Cost(cost: widget.travelPostModel[index].cost),
                  Row(
                    children: [
                      _ApplyButton(),
                      _SettingButton()
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Container(height: 0.1, width: double.infinity, color: Colors.black,),
              SizedBox(height: 20.h,),
            ],
          );
        }
    );
  }
}

class _PostInfo extends StatelessWidget {
  _PostInfo({super.key, this.imageURL, required this.name, required this.title, required this.applied, required this.maxPeople, required this.people});
  String? imageURL;
  String name;
  String title;
  bool applied;
  int people;
  int maxPeople;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100.w,
          child: Row(
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
              SizedBox(width: 10.w,),
              Text(name),
            ],
          ),
        ),
        SizedBox(
          width: 100.w,
            child: Text(title)
        ),
        SizedBox(
          width: 70.w,
          child: Row(
            children: [
              Text(applied ? "참여중" : "대기중"),
              Text("$people / $maxPeople")
            ],
          ),
        )

      ],
    );
  }
}

class _ImportantTravel extends StatelessWidget {
  _ImportantTravel({super.key, required this.travelName});

  List<String> travelName;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class _Cost extends StatelessWidget {
  _Cost({super.key, required this.cost});
  int cost;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.attach_money),
        Text("$cost")
      ],
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      child: Center(child: Text("신청하기"),),
    );
  }
}

class _SettingButton extends StatelessWidget {
  const _SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: Icon(Icons.menu));
  }
}

