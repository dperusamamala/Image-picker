import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? imageFile;
  pickImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.cameragg);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Pick From Gallery')),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(onPressed: () {}, child: const Text('Pick From Camera')),
            if (imageFile != null) ...[
              Image.file(imageFile!),
            ]
          ],
        ),
      ),
    );
  }
}
