

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'botnavi.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // bool isDesktop (BuildContext context)=>MediaQuery.of(context).size.width>=600;
  // bool isMobile (BuildContext context)=>MediaQuery.of(context).size.width>=600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children:[
                Container(
                    height: MediaQuery.of(context).size.height*0.50,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150))
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0,left: 40),
                  child: Container(

                      height: MediaQuery.of(context).size.height*0.60,
                      width: MediaQuery.of(context).size.width*1,
                      child: Image(image: AssetImage('img/imgg.png'))),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.90,
              height: MediaQuery.of(context).size.height*0.30,
              child: Column(
                children: [
                  Text(
                    'Ultimate Destination',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.white),),
                  Text(
                    'for Cinematic Adventures',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.white),),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Movies,shows,on-the-go entertainment,',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white30),),
                  Text(
                    'anytime access,',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white30),),

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Container(
        width: MediaQuery.of(context).size.width*0.12,
        height: MediaQuery.of(context).size.height*0.07,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>const boynavi()));
          },
          child: Icon(Icons.arrow_forward_ios),
          shape: CircleBorder(),
          elevation: 15,
          backgroundColor: Colors.blue.shade300,
        ),
      ),

    );
  }
}