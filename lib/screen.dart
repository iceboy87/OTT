import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ott_pro/video.dart';

class screen extends StatefulWidget {
  const screen({
    super.key,
  });
  @override
  State<screen> createState() => _screenState();
}
class _screenState extends State<screen> {

  List abc = [
    'Movie',
    'Stream',
    'Comedy',
    'Sports',
    'Shots',
    'Entainment',
    'Game',
  ];

  List def = [
    'Avatar: The Way of Water',
    'Iron Man in Marwal',
    'Interseller',
    'House of the dragran',
    'Game of Thrones',
    'The Boys',
    'The pasenger',
  ];

  List ghi = [
    'All',
    'English',
    'Tamil',
    'Hindi',
    'Franch',
    'Gujrati',
    'Telungu',
  ];

  List jkl = [
    'Inception',
    'The Dark knight',
    'The Godfather',
    'The killer',
    'Angry Men',
    'Nepoleon',
  ];

  List image = [
    'img/avator.jpg',
    'img/got.jpg',
    'img/Inter.jpg',
    'img/house.jpg',
    'img/gott.jpeg',
    'img/boys.jpg',
  ];
  List imagee = [
    'img/house.jpg',
    'img/Inter.jpg',
    'img/gott.jpeg',
    'img/boys.jpg',
    'img/got.jpg',
    'img/avator.jpg',
  ];
  int select=0;
void press(int index){
  setState(() {
    select=index;
  });
}

  int btnselect=0;
  void btnpress(int index){
    setState(() {
      btnselect=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
        title: Text(
          'Vedix',
          style: TextStyle(color: Colors.lightBlue.shade200),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cast),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Text(
                'Lets Help You Relax & Watch a Movie',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                cursorColor: Colors.lightBlueAccent,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white10,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white54),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: abc.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        press(index);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            abc[index],
                            style: TextStyle(
                                color: select==index?Colors.blueAccent:Colors.white54,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 240,
              child: ListView.builder(
                  itemCount: image.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => video()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(image[index]),
                                        fit: BoxFit.fill)),
                                height: 170,
                                width: 290,
                                // child: Center(child: Text(a[index]))
                              ),
                            ),
                            elevation: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            def[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '3hr 12min',
                                style: TextStyle(color: Colors.white38),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: RatingBar.builder(
                                initialRating: 1,
                                itemCount: 1,
                                minRating: 1,
                                allowHalfRating: true,
                                itemSize: 18,
                                direction: Axis.horizontal,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            Text(
                              '76/10',
                              style: TextStyle(color: Colors.white38),
                            )
                          ],
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Recommended Movies',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: btnselect==index?Colors.blue:Colors.transparent,
                        ),
                        onPressed: () {
                          btnpress(index);
                        },
                        child: Text(ghi[index],style:TextStyle(color:btnselect==index?Colors.black:Colors.blue), ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 170,
              child: ListView.builder(
                  itemCount: imagee.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(imagee[index]),
                                      fit: BoxFit.cover)),
                              height: 110,
                              width: 110,
                            ),
                            elevation: 15,
                          ),
                        ),
                        Text(
                          jkl[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10),
              child: Text(
                'Comedy Videos',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              height: 190,
              child: ListView.builder(
                  itemCount: jkl.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(image[index]),
                                      fit: BoxFit.cover)),
                              height: 110,
                              width: 110,
                            ),
                            elevation: 15,
                          ),
                        ),
                        Text(
                          jkl[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              height: 240,
              child: ListView.builder(
                  itemCount: def.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(image[index]),
                                      fit: BoxFit.cover)),
                              height: 170,
                              width: 290,
                            ),
                            elevation: 15,
                          ),
                        ),
                        Text(
                          def[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
