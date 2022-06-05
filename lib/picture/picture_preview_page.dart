import 'dart:io';

import 'package:flutter/material.dart';

class PicturePreviewPage extends StatefulWidget {
  final String path;
  const PicturePreviewPage({Key? key, required this.path}) : super(key: key);

  @override
  State<PicturePreviewPage> createState() => _PicturePreviewPageState();
}

class _PicturePreviewPageState extends State<PicturePreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.file(
            File(
              widget.path,
            ),
          ),
        ],
      ),
    );
  }
}
