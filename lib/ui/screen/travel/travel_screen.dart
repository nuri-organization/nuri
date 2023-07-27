import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/cubit/travel/post/travel_post_cubit.dart';
import 'package:nuri/ui/screen/error_screen.dart';
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
        if(state.loadingStatus == LoadingStatus.noData){
          return const Center(child: Text("아직 작성된 게시글이 없습니다. 최초의 게시글을 작성해보세요!"),);
        }
        if(state.loadingStatus == LoadingStatus.fail){
          return const ErrorScreen();
        }
        return Container();
      },
    );
  }
}
