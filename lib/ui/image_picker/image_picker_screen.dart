import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:practice_bloc/bloc/image_picker/image_picker_events.dart';
import 'package:practice_bloc/bloc/image_picker/image_picker_states.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Image Picker Bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBLoc,ImagePickerStates>(
          builder: (context,state){
            if(state.file == null){
              return InkWell(
                onTap: (){
                  context.read<ImagePickerBLoc>().add(CameraCapture());
                },
                child: CircleAvatar(
                  child: Icon(Icons.camera),
                ),
              );
            }else{
              return Image.file(File(state.file!.path.toString())) ;
            }
          },
        ),
      ),
    );
  }
}
