import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DesignGeneratorScreen extends StatelessWidget {
  const DesignGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Design Generator',
          style: TextStyle(color: Colors.green, fontSize: 22),
        ),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint("Select button pressed");
            },
            child: const Text(
              'Select',
              style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildImageTile('assets/images/p1.jpg'),
                _buildImageTile('assets/images/p2.jpg'),
                _buildImageTile('assets/images/p3.jpg'),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                _openCamera(context); // Function to open the camera
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Generate new',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImageTile(String imagePath) {
    return GestureDetector(
      onTap: () {
        debugPrint("Image tapped: $imagePath");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Function to open the camera
  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    // Take a photo with the camera
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // You can display the picked image here or use it in your app
      debugPrint("Image taken: ${image.path}");
      // You can show the image in the UI, save it, or whatever is needed
      // Example of displaying the image using a dialog:
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('New Image'),
          content: Image.file(File(image.path)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } else {
      debugPrint("No image taken.");
    }
  }
}
