import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'ml.dart';
import 'result.dart';

class PictureScreen extends StatefulWidget {
  late XFile picture = XFile('');
  PictureScreen(this.picture, {super.key});

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.picture.path),
          Container(
              height: deviceHeight / 1.5,
              child: Image.file(File(widget.picture.path))),
          Row(
            children: [
              ElevatedButton(
                child: Text('Text Recognition'),
                onPressed: () {
                  MLHelper helper = MLHelper();
                  helper
                      .textFromImage(File(widget.picture.path))
                      .then((result) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(result!)),
                    );
                  });
                },
              ),
              ElevatedButton(
                child: Text('Barcode Reader'),
                onPressed: () {
                  MLHelper helper = MLHelper();
                  helper.readBarcode(File(widget.picture.path)).then((result) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(result)),
                    );
                  });
                },
              ),
              ElevatedButton(
                child: Text('Image Labeler'),
                onPressed: () {
                  MLHelper helper = MLHelper();
                  helper.labelImage(File(widget.picture.path)).then((result) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(result)),
                    );
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Face Recognition'),
                onPressed: () {
                  MLHelper helper = MLHelper();
                  helper
                      .faceRecognition(File(widget.picture.path))
                      .then((result) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(result)),
                    );
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
