import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/cubit/shortory/post/shortory_post_cubit.dart';
import 'package:nuri/ui/screen/error_screen.dart';
import 'package:nuri/ui/screen/shortory/widget/post.dart';

class NuriShortoryScreen extends StatefulWidget {
  const NuriShortoryScreen({super.key});

  @override
  State<NuriShortoryScreen> createState() => _NuriShortoryScreenState();
}

class _NuriShortoryScreenState extends State<NuriShortoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<ShortoryPostCubit>().getShortoryPostInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShortoryPostCubit, ShortoryPostState>(
      builder: (context, state) {
        if (state.loadingStatus == LoadingStatus.success) {
          return SingleChildScrollView(
              child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.postModel != null ? state.postModel!.length : 0,
              itemBuilder: (context, index) {
                return Post(postModel: state.postModel![index]);
              },
            )
          );
        }
        if(state.loadingStatus == LoadingStatus.noData){
          return const Center(child: Text("아직 작성된 게시글이 없어서 최초의 게시글을 작성해보세요!"),);
        }
        if(state.loadingStatus == LoadingStatus.fail){
          return const ErrorScreen();
        }
        return Container();
      },
    );
  }
}
