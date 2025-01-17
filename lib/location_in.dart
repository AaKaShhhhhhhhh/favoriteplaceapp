import 'dart:convert';

import 'package:favoriteplaceapp/favoritplacedetails.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
class locationIn extends StatefulWidget{
  const locationIn({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _locationInState();
  }

}

class _locationInState extends State<locationIn>{
  placelocation? _pickedLocation;
  var isgettingloc = false;

  String get locationImage{
  final lat = _pickedLocation!.latitude;
  final long = _pickedLocation!.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center$lat,$long=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794=AlzaSyJtC1PctK1FPEbgkl3VTFuDfsPa-XdL_Ba&signature=YOUR_SIGNATURE";
  }

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
setState((){

isgettingloc = true;
});

locationData = await location.getLocation();
final lng = locationData.longitude;
final lat = locationData.latitude;
final url = Uri.parse('https://maps.gomaps.pro/maps/api/geocode/json?latlng=$lat,$lng&key=AlzaSyJtC1PctK1FPEbgkl3VTFuDfsPa-XdL_Ba');
final response = await http.get(url);
final resData = json.decode(response.body);
final address = resData['results'][0]['formatted_address'];
if(lat == null || lng == null){
  return;
}

setState((){
isgettingloc = false;
_pickedLocation = placelocation(address: address, latitude: lat, longitude: lng);
});

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