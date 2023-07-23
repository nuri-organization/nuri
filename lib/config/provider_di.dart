import 'package:nuri/cubit/profile/profile_cubit.dart';
import 'package:nuri/cubit/shortory/comment/comment_cubit.dart';
import 'package:nuri/cubit/shortory/post/shortory_post_cubit.dart';
import 'package:nuri/data/remote/shortory/comment/comment_api.dart';
import 'package:nuri/data/remote/shortory/shortory_post_api.dart';
import 'package:nuri/repository/comment_repository.dart';
import 'package:nuri/repository/shortory_post_repository.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';

List<SingleChildWidget> getProvider() {

  final shortoryPostApi = ShortoryPostApi();
  final commentApi = CommentApi();

  final shortoryPostRepositoryImpl = ShortoryPostRepositoryImpl(shortoryPostApi);
  final commentRepositoryImpl = CommentRepositoryImpl(commentApi);


  NavigationCubit navigationCubit = NavigationCubit();
  ProfileCubit profileCubit = ProfileCubit();
  ShortoryPostCubit shortoryPostCubit = ShortoryPostCubit(shortoryPostRepositoryImpl);
  CommentCubit commentCubit = CommentCubit(commentRepositoryImpl);

  return [
    BlocProvider<NavigationCubit>(create: (BuildContext context) => navigationCubit),
    BlocProvider<ProfileCubit>(create: (BuildContext context) => profileCubit),
    BlocProvider<ShortoryPostCubit>(create: (BuildContext context) => shortoryPostCubit),
    BlocProvider<CommentCubit>(create: (BuildContext context) => commentCubit),
  ];
}