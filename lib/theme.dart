import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  bool press = false;


  Future<void> change() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      press=(preferences.getBool('press')??false);
    });
  }


  Future<void> chan() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState((){
      press=!(preferences.getBool('press')??false);
      preferences.setBool('press', press);
    });
  }

  @override

  void initState() {
    super.initState();
    change();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: press? Colors.blueAccent:Colors.amberAccent
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  chan();
                },
                child: Text('change')),
          ),
        ],
      ),
    );
  }
}
