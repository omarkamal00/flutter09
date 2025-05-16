import 'package:flutter/material.dart';

class ConstructionScreen extends StatelessWidget {
  const ConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A5A5A), // ✅ Background color
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
              // ✅ Windows Section (6 Items)
              const Text(
                "Windows",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              _buildRow([
                "assets/images/w1.png",
                "assets/images/w2.png",
                "assets/images/w3.png",
              ], context),
              _buildRow([
                "assets/images/w4.png",
                "assets/images/w5.png",
                "assets/images/w6.png",
              ], context),

              const SizedBox(height: 20),

              // ✅ Doors Section (6 Items)
              const Text(
                "Doors",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              _buildRow([
                "assets/images/d1.png",
                "assets/images/d2.png",
                "assets/images/d3.png",
              ], context),
              _buildRow([
                "assets/images/d4.png",
                "assets/images/d5.png",
                "assets/images/d6.png",
              ], context),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Function to Build Image Rows (for Windows & Doors)
  Widget _buildRow(List<String> imagePaths, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5), // ✅ Added spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: imagePaths.map((path) {
          return GestureDetector(
            onTap: () {
              debugPrint("Clicked on: $path");
            },
            child: Image.asset(
              path,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
}
