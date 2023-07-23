import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/cubit/travel/post/travel_post_cubit.dart';
import 'package:nuri/ui/screen/travel/widget/travel_post.dart';

class NuriTravelScreen extends StatefulWidget {
  const NuriTravelScreen({super.key});

  @override
  State<NuriTravelScreen> createState() => _NuriTravelScreenState();
}

class _NuriTravelScreenState extends State<NuriTravelScreen> {

  @override
  void initState() {
    context.read<TravelPostCubit>().getTravelPostInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelPostCubit, TravelPostState>(
      builder: (context, state) {
        if (state.loadingStatus == LoadingStatus.success) {
          return SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.travelPostModel!.length,
                  itemBuilder: (context, index) {
                    return TravelPost(
                      travelPostModel: state.travelPostModel![index],
                    );
                  }));
        }
        return Container();
      },
    );
  }
}
