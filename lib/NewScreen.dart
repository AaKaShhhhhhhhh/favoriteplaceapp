import 'package:favoriteplaceapp/favoritplacedetails.dart';
import 'package:flutter/material.dart';

class Newscreen extends StatelessWidget{
  const Newscreen({super.key , required this.detailss });

  //final String Placename;
  final details detailss;
  @override
  
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(detailss.name),
         ),
          body: Stack(
            children: [
              Image.file(
              detailss.image!,
              fit: BoxFit.fill,
              width: double.infinity,
              ),
            ]
          ),
        );
      }
    }
  

