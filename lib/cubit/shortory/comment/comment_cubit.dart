import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/post/comment/comment_model.dart';
import 'package:nuri/repository/comment_repository.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.commentRepository) : super(CommentState());


  final CommentRepository commentRepository;

  void getCommentInfo({required int postId}) async{

    var result = await commentRepository.getCommentInfo(postId: postId);

    if(result.isEmpty){
      emit(CommentState(commentModel: result,loadingStatus:  LoadingStatus.noData));
    }
    if(result.isNotEmpty){
      emit(CommentState(commentModel: result,loadingStatus:  LoadingStatus.success));
    }

  }

  void postCommentInfo({required int postId, required String content}) async{
    var result = await commentRepository.postCommentInfo(postId: postId, content: content);
  }

}
