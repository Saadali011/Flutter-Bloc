import 'package:bloc/bloc.dart';
import 'package:practice_bloc/bloc/posts/posts_events.dart';
import 'package:practice_bloc/bloc/posts/posts_states.dart';
import 'package:practice_bloc/repository/posts_repository.dart';
import 'package:practice_bloc/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent , PostStates>{
  PostRepository postRepository = PostRepository();
  PostBloc() : super(PostStates()){
    on<PostFetched>(fetchPostApi);
  }
  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
     await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success,
          message: "Success",
          postList: value
      ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure,
          message:error.toString(),
      ));
    });
  }
}