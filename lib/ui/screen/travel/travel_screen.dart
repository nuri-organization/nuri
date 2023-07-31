import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/cubit/travel/post/travel_post_cubit.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/error_screen.dart';
import 'package:nuri/ui/screen/travel/travel_party_screen.dart';
import 'package:nuri/ui/screen/travel/travel_post_list_screen.dart';
import 'package:nuri/ui/screen/travel/widget/travel_post.dart';

class NuriTravelScreen extends StatefulWidget {
  const NuriTravelScreen({super.key});

  @override
  State<NuriTravelScreen> createState() => _NuriTravelScreenState();
}

class _NuriTravelScreenState extends State<NuriTravelScreen> {
  bool screenState = false;

  @override
  void initState() {
    context.read<TravelPostCubit>().getTravelPostInfo();
    screenState = LocalStorage().getPartyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    screenState = true;

                  });

                  LocalStorage().setPartyData(true);
                },
                child: Text("여행 찾아보기")),
            TextButton(
                onPressed: () {
                  setState(() {
                    screenState = false;
                  });
                  LocalStorage().setPartyData(false);
                },
                child: Text("내 여행보기"))
          ],
        ),

        screenState
            ? TravelPostListScreen()
            : TravelPartyScreen()
      ],
    );
  }
}
