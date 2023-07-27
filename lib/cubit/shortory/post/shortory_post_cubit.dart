import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/repository/shortory_post_repository.dart';

part 'shortory_post_state.dart';

class ShortoryPostCubit extends Cubit<ShortoryPostState> {
  ShortoryPostCubit(this.shortoryPostRepository) : super(ShortoryPostState());

  final ShortoryPostRepository shortoryPostRepository;


  void getShortoryPostInfo() async{

    emit(ShortoryPostState(loadingStatus:  LoadingStatus.loading));

    List<PostModel> result = await shortoryPostRepository.getShortoryPostInfo();

    if(result.isNotEmpty){
      emit( ShortoryPostState(postModel: result, loadingStatus:  LoadingStatus.success));
    }
    if(result.isEmpty){
      emit( ShortoryPostState(loadingStatus:  LoadingStatus.noData));
    }

  }

  void postShortoryPostInfo({required List<ShortoryModel> shortoryModel, required String title, required String content}) async{

    bool result = await shortoryPostRepository.postShortoryPostInfo(shortoryModel: shortoryModel,title: title,content: content);

  }

  void fetchShortoryPostInfo({required List<ShortoryModel> shortoryModel, required String title, required String content}) async{

  }

  void postLike({required int postId}) async{
    bool result = await shortoryPostRepository.postLikes(postId: postId);
  }

  void postBookmark({required int postId}) async{
    bool result = await shortoryPostRepository.postBookmark(postId: postId);
  }

}
