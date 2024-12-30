import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget{
  const ImageInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
    
  }
}
File? _selectedimg;






class _ImageInputState extends State<ImageInput> {
  void _clickpic()async{
  final imagepicker= ImagePicker();
  final pickedimg = await imagepicker.pickImage(source: ImageSource.camera , maxWidth: 600
  );
  if (pickedimg==null){
    return;
  }
  
  setState((){
    _selectedimg = File(pickedimg.path);
  });

}
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _clickpic, 
      icon: const Icon(Icons.camera), 
      label: const Text("Click Picture"),
      );

      if (_selectedimg != null){
        content = Image.file(_selectedimg!  , fit: BoxFit.cover,);
      }


   return Container(
    height: 250,
    width: double.infinity,
    alignment: Alignment.center,
    child: content
   );
  }
}