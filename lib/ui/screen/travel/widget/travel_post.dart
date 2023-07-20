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
        Row(
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
            Text(name),
          ],
        ),

        Text(title),
        Row(
          children: [
            Text(applied ? "참여중" : "대기중"),
            Text("$people / $maxPeople")
          ],
        )

      ],
    );
  }
}

