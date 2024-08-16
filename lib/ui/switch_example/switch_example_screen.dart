import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:practice_bloc/bloc/switch_example/switch_event.dart';
import 'package:practice_bloc/bloc/switch_example/switch_state.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Switch Example"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Notification"),
                  BlocBuilder<SwitchBloc , SwitchStates>(
                    buildWhen:(previous , current ) => previous.isSwtich != current.isSwtich ,
                    builder: (context, state){
                      return Switch(value: state.isSwtich, onChanged:  (newValue){
                        // print(newValue);
                        // print("Here");

                        context.read<SwitchBloc>().add(EnableOrDisableNotification());
                      });
                      },
                  )
                ],
              ),
              const SizedBox(height: 30,),
              BlocBuilder<SwitchBloc , SwitchStates>(
                buildWhen:(previous , current ) => previous.slider != current.slider ,
                builder: (context, state){
                  return   Container(
                    height:200,
                    color: Colors.red.withOpacity(state.slider),
                  );
                  // print("Block");
                },
              ),
              const SizedBox(height: 50,),
              BlocBuilder<SwitchBloc , SwitchStates>(
                buildWhen:(previous , current ) => previous.slider != current.slider ,

                builder: (context, state){
                  return  Slider(value: state.slider, onChanged:(value){
                    // print(state.slider);
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });

                },
              )

            ],
          ),
        )
    );
  }
}
