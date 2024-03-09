import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ott_pro/player.dart';
class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  List jkl=[
    'Alen',
    'Zeo saldana',
    'Laz Alonso',
    'wes studi',
    'jam',
    'lionel',
    'alen',

  ];
  List image=[
    'img/alen.jpeg',
    'img/im.jpeg',
    'img/jam.jpeg',
    'img/images.jpeg',
    'img/lionel.jpeg',
    'img/alen.jpeg',

  ];

  List def=[
    'Avatar: The Way of Water',
    'Iron Man in Marwal',
    'Interseller',
    'House of the dragran',
    'Game of Thrones',
    'The Boys',

  ];
  List imagee=[
    'img/avator.jpg',
    'img/got.jpg',
    'img/Inter.jpg',
    'img/house.jpg',
    'img/gott.jpeg',
    'img/boys.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios),color: Colors.white,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border),color: Colors.white,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.99,
                height: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage('img/Inter.jpg'),fit: BoxFit.fill
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 10),
              child: Text('Intersellar: The Science Flim',style: TextStyle(
                  color: Colors.white,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 5),
              child: Text('2016 released . Sci-fi - 3hr 12min',style: TextStyle(
                  color: Colors.white38,fontSize: 14),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 3),
              child: Row(
                children: [
                  RatingBar.builder(
                      initialRating: 1,
                      itemCount:1,
                      minRating:1,
                      allowHalfRating: true,
                      itemSize: 18,
                      direction: Axis.horizontal,
                      itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,),
                      onRatingUpdate: (rating){print(rating);}
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('7.6',style: TextStyle(color: Colors.white38,fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite,color: Colors.red,size: 20,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.70),
                    child: Text('Most Liked',style: TextStyle(color: Colors.white38,fontSize: 15),),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePagee(title: '')));
                  }, icon: Icon(Icons.play_circle,color: Colors.blueAccent,size: 50,))
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(

                    onPressed: (){}, child: Row(
                    children: [
                      Icon(Icons.add,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Watchlist',style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                  ),
                ),
                OutlinedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.cloud_download_outlined,color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Download',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(color: Colors.white)),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade100,
                    ),
                    onPressed: (){}, child: Text('cast',style: TextStyle(color: Colors.black),),
                  ),
                ),
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade100
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Director & Crew',style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
            Container(
              height: 170,
              child: ListView.builder(
                  itemCount: image.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(image[index]),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              height: 100,
                              width: 80,
                              // child: Center(child: Text(a[index]))
                            ),
                            elevation: 15,
                          ),
                        ),
                        Text(jkl[index],style: TextStyle(color: Colors.white),),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Recommended Movies',style: TextStyle(color: Colors.white,fontSize: 20),),
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
                                      image: AssetImage(imagee[index]),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.blue
                              ),
                              height: 170,
                              width: 290,
                              // child: Center(child: Text(a[index]))
                            ),
                            elevation: 15,
                          ),
                        ),
                        Text(def[index],style: TextStyle(color: Colors.white),),
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
