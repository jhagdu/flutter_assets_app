//Importing Packages
import 'package:assets/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//Configuring Video From Network
class NetworkVideo extends StatefulWidget {
  @override
  _NetVideoAppState createState() => _NetVideoAppState();
}

class _NetVideoAppState extends State<NetworkVideo> {
  VideoPlayerController _controller;

  //OnPress Play-Pause Button of Network Video
  playPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        audioControl(audioStatus);
      } else {
        _controller.play();
        audioControl(0);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://github.com/jhagdu/flutter_assets/blob/master/wildlife.mp4?raw=true')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[ 
        video(),
        playPauseButton(),
      ],
    );
  }  

  video() {
    return GestureDetector(
      onTap: playPause,
      onDoubleTap: () {
        _controller.seekTo(_controller.value.position + Duration(seconds:0));
      },
      child: Center(
        child: _controller.value.initialized
        ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
          )
        : Container(),
      )
    );
  }

  //Creating Play-Pause Button for Network Video
  playPauseButton() {
    return Row(
      children: <Widget>[
        Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.all(2),
          child: FloatingActionButton(
            heroTag: "NetVdo1",
            onPressed: playPause,
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
        Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.all(2),
          child: FloatingActionButton(
            heroTag: "NetVdo2",
            onPressed: () => _controller.seekTo(Duration(seconds: 0)),
            child: Icon(Icons.stop,),
          ),
        ),
      ]
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


//Configuring Asset Video
class AssetVideo extends StatefulWidget {
  @override
  _AssetVideoAppState createState() => _AssetVideoAppState();
}

class _AssetVideoAppState extends State<AssetVideo> {
  VideoPlayerController _controller;

  //OnPress Play-Pause Button of Asset Video
  playPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        audioControl(audioStatus);
      } else {
        _controller.play();
        audioControl(0);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/miniature.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[ 
        video(),
        playPauseButton(),
      ],
    );
  }  

  video() {
    return GestureDetector(
      onTap: playPause,
      onDoubleTap: () {
        _controller.seekTo(_controller.value.position + Duration(seconds: 0));
      },
      child: Center(
        child: _controller.value.initialized
        ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
          )
        : Container(),
      )
    );
  }

  //Creating Play-Pause Button for Asset Video
  playPauseButton() {
    return Row(
      children: <Widget>[
        Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.all(2),
          child: FloatingActionButton(
            heroTag: "AssetVdo1",
            onPressed: playPause,
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
        Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.all(2),
          child: FloatingActionButton(
            heroTag: "AssetVdo2",
            onPressed: () => _controller.seekTo(Duration(seconds: 0)),
            child: Icon(Icons.stop,),
          ),
        ),
      ]
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
