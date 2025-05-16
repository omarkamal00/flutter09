import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'design_screen.dart';
import 'upload_screen.dart';

class MyRoomScreen extends StatefulWidget {
  const MyRoomScreen({super.key});

  @override
  MyRoomScreenState createState() => MyRoomScreenState();
}

class MyRoomScreenState extends State<MyRoomScreen> {
  File? _image;

  Future<void> _openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Back Button
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(55, 127, 76, 1),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            // Room Options
            GestureDetector(
              onTap: _openCamera, // Opens the camera
              child: _buildRoomOption(
                icon: Icons.grid_4x4_outlined,
                title: "Scan room",
                subtitle:
                    "Move phone to capture room corners and create a floor plan",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DesignScreen()),
                );
              },
              child: _buildRoomOption(
                icon: Icons.design_services,
                title: "Design your room",
                subtitle: "Go with magic to create a dream project",
              ),
            ),

            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UploadScreen()),
    );
  },
  child: _buildRoomOption(
    icon: Icons.upload_file,
    title: "Upload a floor plan",
    subtitle: "Instantly digitize your floor plan using our intelligent neural-network",
  ),
),

            const SizedBox(height: 20),
            // Display the captured image
            if (_image != null)
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Captured Image",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.file(
                      _image!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomOption({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
