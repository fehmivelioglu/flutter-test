import 'dart:io';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class ObjectDetectionView extends StatefulWidget {
  const ObjectDetectionView({Key? key}) : super(key: key);

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

                  final InputImage inputImage =
                      InputImage.fromFile(File(image!.paths[0]!));
                  // const mode = DetectionMode.single;

                  final options = ObjectDetectorOptions(
                    mode: DetectionMode.single,
                    classifyObjects: true,
                    multipleObjects: true,
                  );
                  final objectDetector = ObjectDetector(options: options);
                  try {
                    final List<DetectedObject> objects =
                        await objectDetector.processImage(inputImage);
                    print(objects);
                    for (DetectedObject detectedObject in objects) {
                      print(detectedObject.boundingBox);
                      print(detectedObject.trackingId);
                      for (Label label in detectedObject.labels) {
                        print('${label.text} ${label.confidence}');
                      }
                    }
                  } catch (e) {
                    print(e);
                  }
                  objectDetector.close();
                  setState(() {
                    if (image.paths[0] != null) {
                      imageUrl = File(image.paths[0]!);
                    }
                  });
                  print('----------------------------------------');
                  final ImageLabelerOptions options2 =
                      ImageLabelerOptions(confidenceThreshold: 0.5);
                  final imageLabeler = ImageLabeler(options: options2);
                  final List<ImageLabel> labels =
                      await imageLabeler.processImage(inputImage);

                  for (ImageLabel label in labels) {
                    final String text = label.label;
                    final int index = label.index;
                    final double confidence = label.confidence;
                    print(text);
                    print(index);
                    print(confidence);
                  }
                },
                child: const Text('Galeri')),
            if (imageUrl != null) Image.file(imageUrl!),
          ],
        ));
  }
}
