import 'package:flutter/material.dart';
import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:video_player/video_player.dart';

class MyHomePagee extends StatefulWidget {
  const MyHomePagee({super.key, required this.title});

  final String title;

  @override
  State<MyHomePagee> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagee> {
  late FlickManager flickManager1;
  late FlickManager flickManager2;

  @override
  void initState() {
    super.initState();
    flickManager1 = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
        additionalOptions: [
          OptionModel(
              icon: Icons.hd, onPressFeature: _onPressQuality, name: 'Quality')
        ]);

    flickManager2 = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager1.dispose();
    flickManager2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: Colors.white,),),
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlickVideoPlayer(flickManager: flickManager1),
            // FlickVideoPlayer(
            //   flickManager: flickManager2,
            //   flickVideoWithControls: const FlickVideoWithControls(
            //     videoFit: BoxFit.fitWidth,
            //     controls: FlickPortraitControls(),
            //   ),
            //   flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            //     controls: FlickLandscapeControls(),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Intersellar- A science movie | Hollywood | English Movie | Director: CHISTOPHER NOLAN.',
                style: TextStyle(color: Colors.white,fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Text(
                ' 2.4k views 16 hr ago #film',
                style: TextStyle(color: Colors.white54,fontSize: 14),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 22,
                  ),
                ),
                Text('Bhuvanesh_.',style: TextStyle(color: Colors.white,fontSize: 17),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: OutlinedButton(onPressed: (){}, child: Icon(Icons.notifications_active_outlined,color: Colors.blueAccent,)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined,color: Colors.white,size: 16,),
                    Text('  4M  |  ',style: TextStyle(color: Colors.white),),
                    Icon(Icons.thumb_down_alt_outlined,color: Colors.white,size: 16,)
                  ],
                )),
                OutlinedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.share,color: Colors.white,size: 16,),
                    Text('  share',style: TextStyle(color: Colors.white),),
                  ],
                )),
                OutlinedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.file_download_outlined,color: Colors.white,size: 16,),
                    Text('  Download',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.08,
              child: Card(
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 6),
                      child: Text('Comments 109K',style: TextStyle(color: Colors.white,fontSize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 4),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('Best Movie in the world',style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressQuality() async {
    Navigator.pop(context);
    Duration currentPosition = await flickManager1
        .flickVideoManager?.videoPlayerController?.position ??
        const Duration(milliseconds: 0);
    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4");

    flickManager1.handleChangeVideo(videoPlayerController,
        videoChangeDuration: currentPosition, isKeepValueVideo: true);

    flickManager1.flickControlManager?.togglePlay();
  }
}
