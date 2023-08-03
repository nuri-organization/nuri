import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nuri/cubit/Login/login_cubit.dart';
import 'package:nuri/cubit/chat/chat_cubit.dart';
import 'package:nuri/cubit/notification/notification_cubit.dart';
import 'package:nuri/cubit/profile/profile_cubit.dart';
import 'package:nuri/cubit/shortory/comment/comment_cubit.dart';
import 'package:nuri/cubit/shortory/post/shortory_post_cubit.dart';
import 'package:nuri/cubit/travel/accept/travel_accept_cubit.dart';
import 'package:nuri/cubit/travel/check/travel_checklist_cubit.dart';
import 'package:nuri/cubit/travel/member/travel_member_cubit.dart';
import 'package:nuri/cubit/travel/post/travel_post_cubit.dart';
import 'package:nuri/cubit/travel/todo/travel_todolist_cubit.dart';
import 'package:nuri/data/remote/login/login_api.dart';
import 'package:nuri/data/remote/push_alarm/notification_api.dart';
import 'package:nuri/data/remote/shortory/comment/comment_api.dart';
import 'package:nuri/data/remote/shortory/shortory_post_api.dart';
import 'package:nuri/data/remote/travel/travel_accept_api.dart';
import 'package:nuri/data/remote/travel/travel_check_api.dart';
import 'package:nuri/data/remote/travel/travel_member_api.dart';
import 'package:nuri/data/remote/travel/travel_post_api.dart';
import 'package:nuri/data/remote/travel/travel_todo_api.dart';
import 'package:nuri/data/remote/user_profile/user_profile_api.dart';
import 'package:nuri/repository/comment_repository.dart';
import 'package:nuri/repository/login_repository.dart';
import 'package:nuri/repository/notification_repository.dart';
import 'package:nuri/repository/profile_repository.dart';
import 'package:nuri/repository/shortory_post_repository.dart';
import 'package:nuri/repository/travel_accept_repository.dart';
import 'package:nuri/repository/travel_checklist_repository.dart';
import 'package:nuri/repository/travel_member_repository.dart';
import 'package:nuri/repository/travel_repository.dart';
import 'package:nuri/cubit/chat/chat_menu_provider.dart';
import 'package:nuri/repository/travel_todolist_repository.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';

List<SingleChildWidget> getProvider() {

  final shortoryPostApi = ShortoryPostApi();
  final commentApi = CommentApi();
  final travelPostApi = TravelPostApi();
  final userProfileApi = UserProfileApi();
  final loginApi = LoginApi();
  final travelAcceptApi = TravelAcceptApi();
  final travelTodoApi = TravelTodoApi();
  final travelCheckApi = TravelCheckApi();
  final travelMemberApi = TravelMemberApi();
  final notificationApi = NotificationApi();

  final shortoryPostRepositoryImpl = ShortoryPostRepositoryImpl(shortoryPostApi);
  final commentRepositoryImpl = CommentRepositoryImpl(commentApi);
  final travelPostRepositoryImpl = TravelPostRepositoryImpl(travelPostApi);
  final userProfileRepositoryImpl = ProfileRepositoryImpl(userProfileApi);
  final loginRepositoryImpl = LoginRepositoryImpl(loginApi);
  final travelAcceptRepositoryImpl = TravelAcceptRepositoryImpl(travelAcceptApi);
  final travelTodoRepositoryImpl = TravelTodolistRepositoryImpl(travelTodoApi);
  final travelCheckRepositoryImpl = TravelChecklistRepositoryImpl(travelCheckApi);
  final travelMemberRepositoryImpl = TravelMemberRepositoryImpl(travelMemberApi);
  final notificationRepositoryImpl = NotificationImpl(notificationApi);


  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;


  NavigationCubit navigationCubit = NavigationCubit();
  ProfileCubit profileCubit = ProfileCubit(userProfileRepositoryImpl);
  ShortoryPostCubit shortoryPostCubit = ShortoryPostCubit(shortoryPostRepositoryImpl);
  CommentCubit commentCubit = CommentCubit(commentRepositoryImpl);
  TravelPostCubit travelPostCubit = TravelPostCubit(travelPostRepositoryImpl);
  LoginCubit loginCubit = LoginCubit(loginRepositoryImpl);
  ChatMenuProvider chatMenuProvider = ChatMenuProvider(firebaseFirestore: firebaseFirestore);
  ChatCubit chatCubit = ChatCubit(firebaseFirestore: firebaseFirestore, firebaseStorage: firebaseStorage);
  TravelAcceptCubit travelAcceptCubit = TravelAcceptCubit(travelAcceptRepositoryImpl);
  TravelTodolistCubit travelTodolistCubit = TravelTodolistCubit(travelTodoRepositoryImpl);
  TravelChecklistCubit travelChecklistCubit = TravelChecklistCubit(travelCheckRepositoryImpl);
  TravelMemberCubit travelMemberCubit = TravelMemberCubit(travelMemberRepositoryImpl);
  NotificationCubit notificationCubit = NotificationCubit(notificationRepositoryImpl);


  return [
    BlocProvider<NavigationCubit>(create: (BuildContext context) => navigationCubit),
    BlocProvider<ProfileCubit>(create: (BuildContext context) => profileCubit),
    BlocProvider<ShortoryPostCubit>(create: (BuildContext context) => shortoryPostCubit),
    BlocProvider<CommentCubit>(create: (BuildContext context) => commentCubit),
    BlocProvider<TravelPostCubit>(create: (BuildContext context) => travelPostCubit),
    BlocProvider<LoginCubit>(create: (BuildContext context) => loginCubit),
    BlocProvider<ChatMenuProvider>(create: (BuildContext context) => chatMenuProvider),
    BlocProvider<ChatCubit>(create: (BuildContext context) => chatCubit),
    BlocProvider<TravelAcceptCubit>(create: (BuildContext context) => travelAcceptCubit),
    BlocProvider<TravelTodolistCubit>(create: (BuildContext context) => travelTodolistCubit),
    BlocProvider<TravelChecklistCubit>(create: (BuildContext context) => travelChecklistCubit),
    BlocProvider<TravelMemberCubit>(create: (BuildContext context) => travelMemberCubit),
    BlocProvider<NotificationCubit>(create: (BuildContext context) => notificationCubit)
  ];
}