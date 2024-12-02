import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget{
  const ImageInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
    
  }
}
void _clickpic(){

}
class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
   return Container(
    height: 250,
    width: double.infinity,
    alignment: Alignment.center,
    child: TextButton.icon(
      onPressed: _clickpic, 
      icon: const Icon(Icons.camera), 
      label: const Text("Click Picture"),
      ),
   );
  }
}