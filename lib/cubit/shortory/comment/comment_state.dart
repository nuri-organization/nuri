part of 'comment_cubit.dart';

class CommentState extends Equatable {

  CommentState({this.commentModel, this.loadingStatus = LoadingStatus.initial});

  List<CommentModel>? commentModel;
  LoadingStatus loadingStatus;

  @override
  List<Object?> get props => [commentModel, loadingStatus];
}
