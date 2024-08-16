import 'package:practice_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';
import '../../model/posts_model.dart';

class PostStates extends Equatable{
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const<PostModel>[],
    this.message = '',
  });

  PostStates copyWith({PostStatus? postStatus,List<PostModel>? postList,String? message}){
    return PostStates(
      postList: postList ?? this.postList,
      postStatus:postStatus ?? this.postStatus ,
      message: message ?? this.message ,
    );
  }

  @override
  List<Object?> get props => [postStatus,postList,message];
}