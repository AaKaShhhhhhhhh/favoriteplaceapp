

import 'package:favoriteplaceapp/favoritplacedetails.dart';
import 'package:riverpod/riverpod.dart';

class UserPlaceNotfier extends  StateNotifier<List<details>>{

  UserPlaceNotfier() : super(const[]);

  void addplacee(String title ,image){
    final newPLace = details(name: title , image: image);
    state = [newPLace, ...state];

  }
}

final userplacenotif = StateNotifierProvider<UserPlaceNotfier , List<details>>(
  (ref) => UserPlaceNotfier()
);

