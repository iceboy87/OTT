import 'package:flutter/material.dart';
import 'package:ott_pro/open.dart';
import 'package:ott_pro/sign_in.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: TextFormField(
                     decoration: InputDecoration(
                       hintText: "Enter the Email",
                       hintStyle: TextStyle(color: Colors.white),
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: TextFormField(
                     decoration: InputDecoration(
                       hintText: "Enter Password",
                       hintStyle: TextStyle(color: Colors.white),
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                     ),
                   ),
                 ),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                 }, child: Text('Login')),
               ],
             ),
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dont have any account ?',style: TextStyle(color: Colors.white),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
              }, child: Text('Sign in',style: TextStyle(color: Colors.blue),))
            ],
          ),

        ],
      ),
    );
  }
}
