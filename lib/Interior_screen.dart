import 'package:flutter/material.dart';

class InteriorScreen extends StatelessWidget {
  const InteriorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A5A5A), // Matching the background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF5A5A5A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategory("Upholstered Furniture", [
                "assets/images/c38f7efd5563b4ac4e80ad2b0696e888.png",
                "assets/images/c38f7efd5563b4ac4e80ad2b0696e888.png",
                "assets/images/d37b52ed70922622c1da94a79a6272d8.png",
              ], context),
              _buildCategory("Beds", [
                "assets/images/7de559894209393dd19ddc49f8721851.png",
                "assets/images/2372d10b79253904f0b0dac15c63841d.png",
                "assets/images/ad66e31b6af42092cbbe9039ca7d9f29.png",
              ], context),
              _buildCategory("Tables, Chairs", [
                "assets/images/d86026bc627a39333631e7eee86a362a.png",
                "assets/images/af25e5804c0b3d72b005b49c21666827.png",
                "assets/images/35a0cd304da9934f6fdacbce91fdeafe.png",
              ], context),
              _buildCategory("Storage", [
                "assets/images/0d9c539513f4c451bfed97ce0e90dd34.png",
                "assets/images/30baf0aa8e59d8f72e6d8b56f389b0c7.png",
                "assets/images/11738e8ff6d2d7d9a00acdd5b8abd74a.png",
              ], context),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Function to Build Clickable Image Rows
  Widget _buildRow(List<String> imagePaths, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imagePaths.map((path) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context, path); // Return the selected image path
          },
          child: Image.asset(path, width: 90, height: 90, fit: BoxFit.cover),
        );
      }).toList(),
    );
  }

  // ✅ Function to Build Categories with Clickable Images
  Widget _buildCategory(String title, List<String> imagePaths, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 10),
        _buildRow(imagePaths, context),
        const SizedBox(height: 20),
      ],
    );
  }
}
