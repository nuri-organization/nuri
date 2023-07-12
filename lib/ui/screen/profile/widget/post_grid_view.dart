import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostGridView extends StatelessWidget {
  const PostGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            children: List.generate(80, (index) {
              return Container(
                color: Colors.grey,
                child: Text("$index"),
              );
            }),
          ),
        ],
      ),
    );
  }
}
