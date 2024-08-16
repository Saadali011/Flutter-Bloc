import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/todo/to_do_bloc.dart';
import 'package:practice_bloc/bloc/todo/to_do_event.dart';
import 'package:practice_bloc/bloc/todo/to_do_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
      ),
      body: BlocBuilder<ToDoBloc,ToDoState>(
        builder: (context,state){
          if(state.todosList.isEmpty){
            return const Center(child: Text("No ToDo Found"),);
          } else if(state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<ToDoBloc>().add(RemoveTodoEvent(task: state.todosList[index]));

                    },
                  ),

                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          for(int i = 0 ; i < 5; i++) {
            context.read<ToDoBloc>().add(AddTodoEvent(task: 'Task : ' + i.toString()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
