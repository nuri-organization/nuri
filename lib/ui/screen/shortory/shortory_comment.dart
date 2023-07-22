import 'package:flutter/material.dart';
import 'package:nuri/test/comment_data.dart';
import 'package:nuri/ui/screen/shortory/widget/comment.dart';

class ShortoryComment extends StatelessWidget {
  const ShortoryComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Comment(commentModel: TestCommentData().data1[0],)
            ],
          ),
        ),
      ),
    );
  }
}
