import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PicturePage extends StatefulWidget {
  final CameraController? controller;
  const PicturePage({Key? key, this.controller}) : super(key: key);

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(
            0xffF5F5F5,
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Center(
          child: CameraPreview(widget.controller!),
        ),
        floatingActionButton: FloatingActionButton(
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Attempt to take a picture and then get the location
              // where the image file is saved.
              final image = await widget.controller!.takePicture();
              await Navigator.pushNamed(
                context,
                '/picture_preview_page',
                arguments: image.path,
              );
              
            } on CameraException catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
