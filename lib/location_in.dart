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
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
        width: 1.0,
      )
    ),
        child: Text("NO LOCATION YET !" , textAlign: TextAlign.center, style: TextStyle(
        fontSize: 19, color: Color.fromARGB(255, 202, 202, 224)
        ),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(onPressed: (){}, label: Text("GET CURRENT LOCATION"),icon: Icon(Icons.location_on),),
            const SizedBox(width: 20,),
            TextButton.icon(onPressed: (){}, label: Text("SELECT LOCATION"),icon: Icon(Icons.map),),
          ],
        )
      ]
    );
    
  }
}