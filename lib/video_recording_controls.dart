import 'package:flutter/material.dart';

class VideoRecordingControls extends StatelessWidget {
  final Function stop;
  final Function recordVideo;
  final Function pause;
  final Function switchCameras;
  final Function toggleCameraMode;
  final bool isRecording;

  const VideoRecordingControls({
    Key key,
    @required this.switchCameras,
    @required this.pause,
    @required this.stop,
    this.isRecording = false,
    @required this.toggleCameraMode,
    @required this.recordVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            child: Icon(
              Icons.switch_camera,
              color: Colors.black,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(15.0),
            onPressed: () {
              switchCameras();
            },
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            child: Icon(
              isRecording ? Icons.stop : Icons.fiber_manual_record,
              color: Colors.red,
              size: 40,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(15.0),
            onPressed: () {
              // toggle between pause and stop
              if (isRecording) {
                // if its recording, stop
                stop();
              } else {
                // record video action
                recordVideo();
              }
            },
          ),
          SizedBox(
            width: 10,
          ),
          if (isRecording)
            RawMaterialButton(
              child: Icon(
                Icons.pause,
                color: Colors.black,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
              onPressed: () {
                pause();
              },
            ),
          if (!isRecording)
            RawMaterialButton(
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
              onPressed: () {
                toggleCameraMode();
              },
            ),
        ],
      ),
    );
  }
}
