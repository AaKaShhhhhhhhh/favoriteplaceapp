import 'package:favoriteplaceapp/UIscreen.dart';
import 'package:favoriteplaceapp/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrrapper extends StatefulWidget {
  const Wrrapper({super.key});

  @override
  State<Wrrapper> createState() => _WrrapperState();
}

class _WrrapperState extends State<Wrrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context,snapshot){
        if(snapshot.hasData){
          return const Uiscreen();
        }
        else{
          return const Login();
        }
       }
      ),
    );
  }
}