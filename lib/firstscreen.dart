import 'package:favoriteplaceapp/favoritplacedetails.dart';
import 'package:favoriteplaceapp/image_input.dart';
import 'package:favoriteplaceapp/main.dart';
import 'package:favoriteplaceapp/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class firstscreen extends ConsumerStatefulWidget{
  const firstscreen({super.key});

  @override
  ConsumerState<firstscreen> createState() {
    return _firstscreenState();
  }
}


class _firstscreenState extends ConsumerState<firstscreen> {
final formKey = GlobalKey<FormState>();
  var entername = "";


  void saveplace(){
    if(formKey.currentState!.validate())
    {
        formKey.currentState!.save();
        print(entername);
    }
    ref.read(userplacenotif.notifier).addplacee(entername);
    Navigator.of(context).pop(details(name: entername));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 47, 81),
      appBar: AppBar(title: const Text("ADD PLACES"),),

      body:Form(key: formKey, child: 
       Column(
        children: [

          const SizedBox(height: 20,),
          TextFormField(
            style: const TextStyle(color: Color.fromARGB(251, 247, 226, 208)),
            decoration: const InputDecoration(
              
              
              labelText: "Enter Place Name",
              border: OutlineInputBorder(),
              
            ),
            validator: (value) {
                  if (value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                  
                },
            onSaved: (value){entername = value!;} ,

            

          ),
          const SizedBox(height: 20,),
          ImageInput(),
          const SizedBox(width: 20,),
          ElevatedButton(onPressed: saveplace, child: const Text("ADD PLACE")),
        ],
        
      ),
    ));
  }
}