import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
 TextEditingController email= TextEditingController();
 TextEditingController password=TextEditingController();
signin()async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(hintText: "Enter Email"),
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(hintText: "Enter Password"),
          ),
          ElevatedButton(onPressed: signin, child: const Text("LOG IN"))
        ],
      ),
      
      ),
      
    );
  }
}