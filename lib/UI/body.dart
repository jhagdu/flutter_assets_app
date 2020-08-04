//Importing Modules
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import 'video.dart';

//AppBody Class
class AppBody extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  //Base Container
  return Container(
    color: Colors.greenAccent,
    //Base Column
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //First Container for Text
        Container(
          margin: EdgeInsets.only(top: 5),
          color: Colors.transparent,
          //Row for Images Title Text
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Container for Network Image Title
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: deviceHeight*0.06,
                width: deviceWidth*0.45,
                alignment: Alignment.center,
                child: Text('Network Image', textScaleFactor: 1.5, style: TextStyle(color: Colors.white),),
              ),
              Text('|', textScaleFactor: 2.5,),

              //Container for Asset Image Title
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: deviceHeight*0.06,
                width: deviceWidth*0.45,
                alignment: Alignment.center,
                child: Text('Asset Image', textScaleFactor: 1.5, style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),

        //Row For Images
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          //Card for Network Image
          Card(
            elevation: 10,
            color: Colors.transparent,
            child: Container(
              width: deviceWidth*0.47,
              height: deviceHeight*0.19,
              padding: EdgeInsets.all(5),
              child:  FullScreenWidget(
                child: ClipRRect(
                  child: Image.network('https://github.com/jhagdu/flutter_assets_app/blob/master/Network_Assets/lions.jfif?raw=true', fit: BoxFit.contain,),
                ),
              )
            ),
          ),

          //Card for Asset Image
          Card(
            elevation: 10,
            color: Colors.transparent,
            child: Container(
              width: deviceWidth*0.47,
              height: deviceHeight*0.19,
              padding: EdgeInsets.all(5),
              child:  FullScreenWidget(
                child: ClipRRect(
                  child: Image.asset("assets/images/bird.jpg", fit: BoxFit.contain,),
                ),
              )
            ),
          ),
        ],),

        //Card for Network Video Title
        Card(
          color: Colors.red,
          child: Container(
            height: deviceHeight*0.06,
            width: deviceWidth,
            alignment: Alignment.center,
            child: Text('Video From Network', textScaleFactor: 1.5,),
          ),
        ),

        //Card for Network Video
        Card(
          color: Colors.black26,
          child: Container(
            height: deviceHeight*0.21,
            child: NetworkVideo(),
          ),
        ),

        //Card for Asset Video Title
        Card(
          color: Colors.red,
          child: Container(
            height: deviceHeight*0.06,
            width: deviceWidth,
            alignment: Alignment.center,
            child: Text('Video From Asset', textScaleFactor: 1.5, style: TextStyle(color: Colors.black),),
          ),
        ),
        
        //Card for Asset Video 
        Card(
          color: Colors.black26,
          child: Container(
            height: deviceHeight*0.21,
            child: AssetVideo(),
            //child: SamplePlayer(),
          ),
        ),
      ],
      ),
    );
  }
}
