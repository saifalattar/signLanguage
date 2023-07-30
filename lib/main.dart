import 'dart:convert';

import 'package:camera/camera.dart';
import "package:flutter/material.dart";
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import "package:dio/dio.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // camera = await availableCameras();
  var model = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 2, // defaults to 1
      isAsset:
          true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate: false);
  runApp(MaterialApp(home: Home()));
}

var ip = ImagePicker();

XFile? image;

String? output;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("$output"),
          ElevatedButton(
              onPressed: () async {
                await Ai();
                await runModel();
              },
              child: Text("Ai")),
        ],
      ),
    );
  }

  runModel() async {
    print("here");
    if (true) {
      var predictions = await Tflite.runModelOnImage(
          path: image!.path,
          imageMean: 127.5,
          imageStd: 127.5,
          numResults: 2,
          threshold: 0,
          asynch: true);
      print(predictions);

      if (predictions != null && predictions.isNotEmpty) {
        setState(() {
          output = predictions[0]['label'];
        });
      } else {
        setState(() {
          output = 'No predictions found.';
        });
      }
    }
  }
}

Future Ai() async {
  int imageCount = 0;

  var ip = ImagePicker();

  image = await ip.pickImage(source: ImageSource.camera);
}
