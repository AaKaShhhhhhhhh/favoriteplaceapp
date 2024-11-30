import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget{
  ImageInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
    
  }
}
class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
   return Container(
    height: 250,
    width: double.infinity,
    alignment: Alignment.center,
    child: TextButton.icon(
      onPressed: (){}, 
      icon: Icon(Icons.camera), 
      label: Text("Click Picture"),
      ),
   );
  }
}