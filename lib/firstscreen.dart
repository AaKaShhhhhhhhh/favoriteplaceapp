import 'package:favoriteplaceapp/favoritplacedetails.dart';
import 'package:flutter/material.dart';

class firstscreen extends StatefulWidget{
  firstscreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _firstscreenState();
  }
}


class _firstscreenState extends State<firstscreen> {
final formKey = GlobalKey<FormState>();
  var entername = "";


  void saveplace(){
    if(formKey.currentState!.validate())
    {
        formKey.currentState!.save();
        print(entername);
    }
    
    Navigator.of(context).pop(details(name: entername));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("ADD PLACES"),),

      body:Form(key: formKey, child: 
       Column(
        children: [
          TextFormField(
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
          ElevatedButton(onPressed: saveplace, child: Text("ADD PLACE")),
        ],
        
      ),
    ));
  }
}