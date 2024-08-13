import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/counter/counter_bloc.dart';
import 'package:practice_bloc/bloc/counter/counter_event.dart';
import 'package:practice_bloc/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Example"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
            builder: (context ,state){
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize:60),
                ),
              );
            },

          ),

          const SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text("Increment")),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());

              }, child: const Text("Decrement")),

            ],
          )
        ],
      ),
    );
  }
}
