import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/shortory/comment/comment_cubit.dart';
import 'package:nuri/test/comment_data.dart';
import 'package:nuri/ui/screen/shortory/widget/comment.dart';

class ShortoryComment extends StatefulWidget {
  ShortoryComment({super.key,required this.userName});
  String userName;

  @override
  State<ShortoryComment> createState() => _ShortoryCommentState();
}

class _ShortoryCommentState extends State<ShortoryComment> {

  @override
  void initState() {
    context.read<CommentCubit>().getCommentInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      title: "${widget.userName} 게시글의 댓글",
      child: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          if (state.loadingStatus == LoadingStatus.success) {
            return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.commentModel!.length,
                  itemBuilder: (context, index) {
                    return Comment(
                      commentModel: TestCommentData().data1[index],
                    );
                  },
                ));
          }
          return Container();
        },
      ),
    );
  }
}
