import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class ObjectDetectionView extends StatefulWidget {
  const ObjectDetectionView({Key? key}) : super(key: key);

  @override
  State<ObjectDetectionView> createState() => _ObjectDetectionViewState();
}

class _ObjectDetectionViewState extends State<ObjectDetectionView> {
  final InputImage inputImage = InputImage.fromFilePath(
      'https://static.nadirkitap.com/fotograf/85580/33/Kitap_202307300032068558011.jpg');
  // Use DetectionMode.stream when processing camera feed.
// Use DetectionMode.single when processing a single image.

// final objectDetector = ObjectDetector(options: options);

  Future imgProcess() async {
    final mode = DetectionMode.single;

    final options = ObjectDetectorOptions(
      mode: DetectionMode.single,
      classifyObjects: true,
      multipleObjects: true,
    );
    print(mode);
    final objectDetector = ObjectDetector(options: options);
    final List<DetectedObject> objects =
        await objectDetector.processImage(inputImage);

    // for (DetectedObject detectedObject in objects) {
    //   print(detectedObject);
    //   // final rect = detectedObject.boundingBox;
    //   // final trackingId = detectedObject.trackingId;

    //   // for (Label label in detectedObject.labels) {
    //   //   print('${label.text} ${label.confidence}');
    //   // }
    // }
  }

  @override
  void initState() {
    super.initState();
    imgProcess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
