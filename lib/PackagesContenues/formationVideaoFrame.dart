import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FormationVideo extends StatefulWidget {
  const FormationVideo({Key? key}) : super(key: key);

  @override
  State<FormationVideo> createState() => _FormationVideoState();
}

class _FormationVideoState extends State<FormationVideo> {
  final videoURL = "https://www.youtube.com/shorts/B7HdzUv5iG8";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Formation"),
          elevation: 0,
        ),
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Color(0xFFEDECF2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
                child: Column(
                  children: [
                    Container(
                      // height:100,
                      padding: EdgeInsets.all(10),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                   Column(children: [
                     for(int i =1;i<10;i++)
                     Container(
                         decoration:  BoxDecoration(
                             color: Colors.white,
                             borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(5),
                               topRight: Radius.circular(5),
                               bottomLeft: Radius.circular(5),
                               bottomRight: Radius.circular(5),
                             ),
                             boxShadow: [
                               BoxShadow(
                                   color: Colors.black.withOpacity(0.2),
                                   blurRadius: 2.0,
                                   spreadRadius: .05
                               )
                             ]
                         ),
                         padding: EdgeInsets.all(10),
                         margin: EdgeInsets.all(10),
                         child: Row(
                           children: [
                             Container(
                               height: 100,
                               width: 100,
                               decoration: BoxDecoration(
                                   color: Colors.greenAccent,
                                   borderRadius: BorderRadius.circular(10)),
                               child: const Icon(
                                 Icons.play_circle_outline,
                                 size: 40,
                                 color: Colors.grey,
                               ),
                             ),
                             Container(
                               child:  Column(
                                 children: [
                                   Container(
                                     width: 250,
                                     padding: EdgeInsets.all(10),                                    child: const Text(
                                     "JComment devenir riche en aviculture ?",
                                     style: TextStyle(
                                         color: Colors.green,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 18),
                                   ),
                                   ),
                                   SizedBox(height: 10,),
                                   Container(child:
                                   Row(

                                     children: [
                                       Container(
                                         padding: EdgeInsets.all(10),
                                         child:  Text("Durée:", style: TextStyle(
                                             color: Colors.green,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 15)),
                                       ),
                                       SizedBox(width: 80,),
                                       Container(  padding: EdgeInsets.all(5),
                                         decoration: BoxDecoration(
                                             color: Colors.grey,
                                             borderRadius: BorderRadius.circular(10)),
                                         child: const Text("20 minutes", style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 15)),
                                       )
                                     ],
                                   ),)
                                 ],
                               ),
                             )
                           ],
                         ))
                   ],)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
