import 'package:flutter/material.dart';

class Upload2Screen extends StatelessWidget {
  const Upload2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF007A58),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Title and Price Section
              const Text(
                'Plan Recognition',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007A58),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '20 units\nEGP 2,999.99',
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Image Display (Image is now centered and takes up less than the entire screen)
              GestureDetector(
                onTap: () {
                  // You can implement the logic for image interaction here if needed
                },
                child: Container(
                  width: double.infinity, // Ensures full width
                  height: 300, // The height of the image section (not the entire screen)
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/floorplan.png'), // Replace with your actual image path
                      fit: BoxFit.cover, // Ensures the image fills the container
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Description Section
              const Text(
                'Turn your floor plan into a digital plan\nSeamlessly convert a floor plan image into a fully customizable 3D project',
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Button to Proceed
              ElevatedButton(
                onPressed: () {
                  debugPrint("Next Button Pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF228B22),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Tap to buy',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Use high-quality architectural-style images in JPEG or PNG format',
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
