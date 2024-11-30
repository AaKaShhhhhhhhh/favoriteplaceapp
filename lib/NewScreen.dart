import 'package:flutter/material.dart';

class Newscreen extends StatefulWidget{
  const Newscreen({super.key , required this.Placename});

  final String Placename;

  @override
  State<StatefulWidget> createState() => _NewscreenState();}
    class _NewscreenState extends State<Newscreen> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.Placename),
          )
        );
      }
    }
  

