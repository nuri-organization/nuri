import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/cubit/shortory/post/shortory_post_cubit.dart';
import 'package:nuri/ui/screen/shortory/widget/post.dart';

class NuriShortoryScreen extends StatefulWidget {
  const NuriShortoryScreen({super.key});

  @override
  State<NuriShortoryScreen> createState() => _NuriShortoryScreenState();
}

class _NuriShortoryScreenState extends State<NuriShortoryScreen> {
  @override
  void initState() {
    context.read<ShortoryPostCubit>().getShortoryPostInfo();
    super.initState();
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
              itemCount: state.postModel!.length,
              itemBuilder: (context, index) {
                return Post(postModel: state.postModel![index]);
              },
            )
          );
        }
        return Container();
      },
    );
  }
}
