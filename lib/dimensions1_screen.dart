import 'package:flutter/material.dart';
import 'dimensions2_screen.dart'; // ✅ Import Dimensions2Screen

class Dimensions1Screen extends StatefulWidget {
  const Dimensions1Screen({super.key});

  @override
  Dimensions1ScreenState createState() => Dimensions1ScreenState();
}

class Dimensions1ScreenState extends State<Dimensions1Screen> {
  double length = 500; // Initial Length
  double width = 490;  // Initial Width

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // ✅ Now the whole page is scrollable
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Back & Close Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(55, 127, 76, 1), size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Color.fromRGBO(55, 127, 76, 1), size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Title
              const Text(
                "Setup room dimensions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Room Layout Box (Resizable Floor)
              Container(
                height: width / 2,  // Dynamic height based on width slider
                width: length / 2,   // Dynamic width based on length slider
                decoration: BoxDecoration(
                  color: Colors.brown.shade400,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Room (${(length * width / 10000).toStringAsFixed(1)} m²)",
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              // Length Slider
              _buildSlider("Length", Colors.brown, length, (value) {
                setState(() {
                  length = value;
                });
              }),
              // Width Slider
              _buildSlider("Width", Colors.blue, width, (value) {
                setState(() {
                  width = value;
                });
              }),
              const SizedBox(height: 30),
              // ✅ Updated Next Button (Passes Length & Width)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dimensions2Screen(length: length, width: width), // ✅ Pass Length & Width
                    ),
                  );
                },
                child: const Text("Next", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 30), // ✅ Extra space at the bottom for smooth scrolling
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String label, Color color, double value, Function(double) onChanged) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            Text("${value.toStringAsFixed(0)} cm", style: const TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
        Slider(
          value: value,
          min: 300,
          max: 700,
          activeColor: color,
          onChanged: (newValue) {
            onChanged(newValue);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
