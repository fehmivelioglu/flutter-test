import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerScreen extends StatelessWidget {
  const FilePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () async {
                final result =
                    await FilePicker.platform.pickFiles(type: FileType.image);

                if (result != null) {
                  final file = File(result.files.single.path!);
                  print(file);
                } else {
                  // User canceled the picker
                }
              },
              child: const Text('Pick something'),),
        ],
      ),),
    );
  }
}
