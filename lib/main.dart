import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/counter/counter_bloc.dart';
import 'package:practice_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:practice_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:practice_bloc/ui/image_picker/image_picker_screen.dart';
import 'package:practice_bloc/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(),),
        BlocProvider(create: (_) => SwitchBloc(),),
        BlocProvider(create: (_) => ImagePickerBLoc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
