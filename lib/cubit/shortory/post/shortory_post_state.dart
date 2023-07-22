part of 'shortory_post_cubit.dart';

class ShortoryPostState extends Equatable {
  ShortoryPostState({this.loadingStatus = LoadingStatus.initial,this.postModel});

  List<PostModel>? postModel;
  LoadingStatus loadingStatus;

  @override
  List<Object?> get props => [postModel, loadingStatus];
}
