import 'package:flutter/material.dart';
import 'package:nuri/test/post_data.dart';
import 'package:nuri/ui/screen/shortory/widget/post.dart';

class NuriShortoryScreen extends StatefulWidget {
  const NuriShortoryScreen({super.key});

  @override
  State<NuriShortoryScreen> createState() => _NuriShortoryScreenState();
}

class _NuriShortoryScreenState extends State<NuriShortoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child : Post(postModel: TestPostData().data1,)
    );
  }
}
