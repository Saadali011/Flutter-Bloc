import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/posts/posts_bloc.dart';
import 'package:practice_bloc/bloc/posts/posts_events.dart';
import 'package:practice_bloc/bloc/posts/posts_states.dart';
import 'package:practice_bloc/utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Post APIs"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc,PostStates>(
        builder: (context, state) {
          switch(state.postStatus){
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.postList.length,
                  itemBuilder:(context,index){
                  final item = state.postList[index];
                    return ListTile(
                      title:Text(item.email.toString()) ,
                      subtitle: Text(item.body.toString()) ,
                    );
                  }
              );
          }

        },
      )
    );
  }
}
