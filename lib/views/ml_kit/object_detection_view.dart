import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class ObjectDetectionView extends StatefulWidget {
  const ObjectDetectionView({super.key});

  @override
  State<ObjectDetectionView> createState() => _ObjectDetectionViewState();
}

class _ObjectDetectionViewState extends State<ObjectDetectionView> {
  File? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextButton(
                onPressed: () async {
                  final image =
                      await FilePicker.platform.pickFiles(type: FileType.image);

                  final inputImage =
                      InputImage.fromFile(File(image!.paths[0]!));
                  // const mode = DetectionMode.single;

                  final options = ObjectDetectorOptions(
                    mode: DetectionMode.single,
                    classifyObjects: true,
                    multipleObjects: true,
                  );
                  final objectDetector = ObjectDetector(options: options);
                  try {
                    final objects =
                        await objectDetector.processImage(inputImage);
                    print(objects);
                    for (final detectedObject in objects) {
                      print(detectedObject.boundingBox);
                      print(detectedObject.trackingId);
                      for (final label in detectedObject.labels) {
                        print('${label.text} ${label.confidence}');
                      }
                    }
                  } catch (e) {
                    print(e);
                  }
                  await objectDetector.close();
                  setState(() {
                    if (image.paths[0] != null) {
                      imageUrl = File(image.paths[0]!);
                    }
                  });
                  print('----------------------------------------');
                  final options2 =
                      ImageLabelerOptions();
                  final imageLabeler = ImageLabeler(options: options2);
                  final labels =
                      await imageLabeler.processImage(inputImage);

                  for (final label in labels) {
                    final text = label.label;
                    final index = label.index;
                    final confidence = label.confidence;
                    print(text);
                    print(index);
                    print(confidence);
                  }
                },
                child: const Text('Galeri'),),
            if (imageUrl != null) Image.file(imageUrl!),
          ],
        ),);
  }
}
