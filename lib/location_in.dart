import 'package:flutter/material.dart';
import 'package:location/location.dart';

class locationIn extends StatefulWidget{
  const locationIn({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _locationInState();
  }

}

class _locationInState extends State<locationIn>{

  void getlocation()async{

    Location location = Location();

bool serviceEnabled;
PermissionStatus permissionGranted;
LocationData locationData;

serviceEnabled = await location.serviceEnabled();
if (!serviceEnabled) {
  serviceEnabled = await location.requestService();
  if (!serviceEnabled) {
    return;
  }
}

permissionGranted = await location.hasPermission();
if (permissionGranted == PermissionStatus.denied) {
  permissionGranted = await location.requestPermission();
  if (permissionGranted != PermissionStatus.granted) {
    return;
  }
}

locationData = await location.getLocation();
print(locationData.latitude);
print(locationData.longitude);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 171,
          decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
        width: 1.0,
      )
    ),
        child: const Text("NO LOCATION YET !" , textAlign: TextAlign.center, style: TextStyle(
        fontSize: 19, color: Color.fromARGB(255, 202, 202, 224)
        ),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(onPressed: (){
              getlocation();
            }, 
            label: const Text("GET CURRENT LOCATION"),
            icon: const Icon(Icons.location_on),),

            const SizedBox(width: 20,),

            TextButton.icon(onPressed: (){}, 
            label: const Text("SELECT LOCATION"),
            icon: const Icon(Icons.map),
            ),
          ],
        )
      ]
    );
    
  }
}