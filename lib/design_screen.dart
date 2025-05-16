import 'package:flutter/material.dart';
import 'dimensions1_screen.dart'; // ✅ Added Import for Dimensions1Screen

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Color.fromRGBO(55, 127, 76, 1), size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 10),
            // Title
            const Text(
              "Choose room type. Different types of rooms use different furniture. You can't change it later.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Room Options Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,
                children: [
                  _buildRoomOption(context, "Kitchen", "assets/images/kitchen.png"),
                  _buildRoomOption(context, "Bedroom", "assets/images/bedroom.png"),
                  _buildRoomOption(context, "Bathroom", "assets/images/bathroom.png"),
                  _buildRoomOption(context, "Office", "assets/images/office.png"),
                  _buildRoomOption(context, "Living Room", "assets/images/livingroom.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomOption(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dimensions1Screen()), // ✅ Updated to navigate to Dimensions1Screen
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 60, height: 60),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(55, 127, 76, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
