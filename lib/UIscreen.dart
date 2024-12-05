import 'package:favoriteplaceapp/NewScreen.dart';

import 'package:favoriteplaceapp/favoritplacedetails.dart';
import 'package:favoriteplaceapp/firstscreen.dart';
import 'package:favoriteplaceapp/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class Uiscreen extends ConsumerStatefulWidget{
  const Uiscreen({super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UiscreenState();}
    class _UiscreenState extends ConsumerState<Uiscreen> {
     final List<details> Deataiill=[];
  
  var loading=true;
      void addplaces(context) async{
       final newItem= await Navigator.of(context).push<details>( MaterialPageRoute(builder: (context) => const firstscreen()));
        if(newItem==null){
      return;
    }
    setState(() {
      Deataiill.add(newItem);
    });
      }

      void newsaveplace(index){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> Newscreen(Placename: Deataiill[index].name)));
      }

      @override
  Widget build(BuildContext context ) {
    final ref = this.ref;
    final userplace = ref.watch(userplacenotif);
 
    Widget content = const Center(
      child: Text(" NO DATA YET ! ", 
      style: TextStyle(
        fontSize: 22, color: Color.fromARGB(255, 202, 202, 224)
        ),
        )
        );

        if(Deataiill.isNotEmpty){content = ListView.builder(
          itemCount: Deataiill.length,
          itemBuilder: (context, index) =>InkWell(child:  Card(child:   ListTile(
            
            title: Text(Deataiill[index].name, 
          ),
          leading: const SizedBox(width: 21, height: 20,),
          )
          ),
          onTap: (){newsaveplace(index);} ,
          )
          );
          }
        


         return Scaffold(
          appBar: AppBar(
            title: const Text('Places'),
            backgroundColor: Colors.blueAccent,
            actions: [
              IconButton(icon: const Icon(Icons.add), onPressed: (){addplaces(context);}),
            ],
            
          ),
          body:content,
         );
    }
   

    }

    





