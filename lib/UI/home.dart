//Importing Modules
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'body.dart';

//Global Variables
var audio1 = AudioPlayer();
var audio2 = AudioPlayer();
var audioStatus = 1;

//Function for Setting Audio to AudioPlayers
setAudio() {
  audio1.setUrl('https://github.com/jhagdu/flutter_assets_app/blob/master/Network_Assets/audio1.mp3?raw=true');
  audio1.setReleaseMode(ReleaseMode.LOOP);

  audio2.setUrl('https://github.com/jhagdu/flutter_assets_app/blob/master/Network_Assets/audio2.mp3?raw=true');
  audio2.setReleaseMode(ReleaseMode.LOOP);
}

//Function for Controlling Audio
audioControl(int status) async {
  if (status == 1) {
    await audio1.resume();
    await audio2.release();
  } 
  else if(status == 2) {
    await audio1.release();
    await audio2.resume();
  } 
  else {
    await audio1.release();
    await audio2.release();
  }
}

//Defining Asset App
assetApp() {

  //Call Set Audio Function
  setAudio();
  //Start Audio on App Startup
  audioControl(audioStatus);

  //onPress Audio1 Button
  audio1Press() { 
    audioStatus = 1;
    audioControl(audioStatus);
  }

  //onPress Audio2 Button
  audio2Press() {
    audioStatus = 2;
    audioControl(audioStatus);
  }

  //onPress AudioOff Button
  audioOffPress() {
    audioStatus = 3;
    audioControl(audioStatus);
  }  

  //Audio Icons and Buttons
  var audio1Icon = Icon(Icons.music_note, color: Colors.blue,);
  var audio1Button = IconButton(icon: audio1Icon, onPressed: audio1Press);

  var audio2Icon = Icon(Icons.audiotrack, color: Colors.blue,);
  var audio2Button = IconButton(icon: audio2Icon, onPressed: audio2Press);

  var audioOffIcon = Icon(Icons.volume_off, color: Colors.redAccent,);
  var audioOffButton = IconButton(icon: audioOffIcon, onPressed: audioOffPress);

  //Material App
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.music_video, color: Colors.lightBlueAccent),
        backgroundColor: Colors.black,
        title: Text('MediaPlayer', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        actions: <Widget>[audio1Button, audio2Button, audioOffButton],
      ),
      body: SafeArea(child: AppBody()),
    ),
  );
}