import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
              alignment: Alignment.topLeft,
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
              "Your AI Home Decorator",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(55, 127, 76, 1),
              ),
            ),
            const SizedBox(height: 20),
            // Image
            Image.asset(
              "assets/images/op.jpg", // First image
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Description
            const Text(
              "Discover the perfect design aesthetic with our AI tool to transform your home into a stunning living space",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            // Next Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutNextScreen()),
                );
              },
              child: const Icon(Icons.arrow_forward, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class AboutNextScreen extends StatelessWidget {
  const AboutNextScreen({super.key});

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
            // Back Button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(55, 127, 76, 1), size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 10),
            // Title Above the Image
            const Text(
              "Decor Staging and\nFurniture Showcase",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(55, 127, 76, 1),
              ),
            ),
            const SizedBox(height: 20), // Space between title and image
            // Image
            Image.asset(
              "assets/images/op2.jpg", // Second image
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Description
            const Text(
              "Show off your furniture and decor in lots of styles with Decor Staging.\n\n"
              "You can see your stuff would look in all kinds of different designs, like a pro decorator. Showcase any furniture or other object.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
