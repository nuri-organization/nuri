import 'package:flutter/material.dart';
import 'package:nuri/test/travel_post_data.dart';
import 'package:nuri/ui/screen/travel/widget/travel_post.dart';

class NuriTravelScreen extends StatefulWidget {
  const NuriTravelScreen({super.key});

  @override
  State<NuriTravelScreen> createState() => _NuriTravelScreenState();
}

class _NuriTravelScreenState extends State<NuriTravelScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TravelPost(travelPostModel: TestTravelPostData().data1,),
    );
  }
}
