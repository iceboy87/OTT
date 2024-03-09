import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ott_pro/screen.dart';
import 'acc_page.dart';
import 'open.dart';

class boynavi extends StatefulWidget {
  const boynavi({super.key});

  @override
  State<boynavi> createState() => _boynaviState();
}

class _boynaviState extends State<boynavi> {
  int _index = 0;

  final page = [
    screen(),
    MyHomePage(),
    screen(),
    qwerty()
  ];
  void tap(index) {
    setState(() {
      _index = index;
    });
  }

  // int _page = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();



  int select=0;
  void change(int index){
    setState(() {
      select=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   color: Colors.black,
      //   buttonBackgroundColor: Colors.transparent,
      //   key: _bottomNavigationKey,
      //   items: <Widget>[
      //     Icon(Icons.favorite, size: 30,color: select==_index?Colors.black:Colors.blue,),
      //     Icon(Icons.home, size: 30, color: select==_index?Colors.black:Colors.blue,),
      //     Icon(Icons.account_circle, size: 38,color: select==_index?Colors.black:Colors.blue,),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _index = index;
      //     });
      //   },
      // ),
      body: page[_index],

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GNav(
            gap: 8,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.blueAccent,
            padding: EdgeInsets.all(10),
            onTabChange: tap,
            backgroundColor: Colors.black,
            color: Colors.white,
            tabs: [
              GButton(icon:Icons.home, text: 'Home'),
              GButton(icon:Icons.favorite_border,  text: 'Likes',),
              GButton(icon:Icons.bookmark_border,  text: 'Save',),
              GButton(icon:Icons.account_circle_outlined,  text: 'Profile',),

            ],),
        ),
    ),
    );
  }
}
