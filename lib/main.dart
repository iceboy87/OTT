import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ott_pro/screen.dart';
import 'package:ott_pro/sign_in.dart';
import 'acc_page.dart';
import 'login.dart';
import 'open.dart';
import 'sample.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        AnimatedSplashScreen(
          duration: 2500,
          splash: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('img/hhhh.png'),
                    width: 300,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Hai There..!",
                    style: TextStyle(
                        color: Color(0xFF75E6DA),
                        fontSize: 40,
                        fontStyle: FontStyle.italic),
                  ),
                  Divider(
                    indent: 10,
                    color: Colors.white,
                  ),
                ],
              )),
          splashIconSize: 500,
          nextScreen: login(),
          // splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Color(0xFF41729F),
        )
    );
  }
}
