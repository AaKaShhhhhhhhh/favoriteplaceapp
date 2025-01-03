import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget{
  const ImageInput({super.key, required this.onselectimage});

  final void Function(File image) onselectimage;

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
  widget.onselectimage(_selectedimg!);

}
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _clickpic, 
      icon: const Icon(Icons.camera), 
      label: const Text("Click Picture"),
      );

      if (_selectedimg != null){
        content = GestureDetector( 
          onTap: _clickpic,
          child: Image.file(_selectedimg!  ,
           fit: BoxFit.cover, 
           width: double.infinity,
           height: double.infinity,)
           );
      }


   return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
        width: 1.0,
      )
    ),
    height: 250,
    width: double.infinity,
    alignment: Alignment.center,
    child: content
   );
  }
}