import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/counter/counter_bloc.dart';
import 'package:practice_bloc/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:practice_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:practice_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:practice_bloc/bloc/todo/to_do_bloc.dart';
import 'package:practice_bloc/repository/favourite_repository.dart';
import 'package:practice_bloc/ui/favourite_app/favourite_app_screen.dart';
import 'package:practice_bloc/ui/image_picker/image_picker_screen.dart';
import 'package:practice_bloc/ui/todo/to_do_screen/to_do_screen.dart';
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
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FavouriteAppScreen(),
      ),
    );
  }
}
