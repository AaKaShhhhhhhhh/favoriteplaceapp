import 'dart:io';



class placelocation{

  const placelocation({required this.address , required this.latitude , required this.longitude});
  
  final double longitude;
  final double latitude;
  final String address;
}
class details{
  details({
  required this.name , required this.image 
  //, required this.location
  });


final String name;
final File? image;
//final placelocation location;
}