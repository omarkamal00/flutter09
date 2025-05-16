import 'package:flutter/material.dart';
import 'Interior_screen.dart';
import 'Construction_Screen.dart'; // ✅ Import ConstructionScreen

class Dimensions2Screen extends StatefulWidget {
  final double length;
  final double width;

  const Dimensions2Screen({super.key, required this.length, required this.width});

  @override
  Dimensions2ScreenState createState() => Dimensions2ScreenState();
}

class Dimensions2ScreenState extends State<Dimensions2Screen> {
  late double length;
  late double width;
  late Offset topLeft;
  late Offset bottomRight;

  @override
  void initState() {
    super.initState();
    length = widget.length;
    width = widget.width;
    topLeft = const Offset(50, 300);
    bottomRight = Offset(50 + length / 2, 300 + width / 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            left: topLeft.dx,
            top: topLeft.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  topLeft = Offset(topLeft.dx + details.delta.dx, topLeft.dy + details.delta.dy);
                  bottomRight = Offset(bottomRight.dx + details.delta.dx, bottomRight.dy + details.delta.dy);
                });
              },
              child: Stack(
                children: [
                  Container(
                    width: bottomRight.dx - topLeft.dx,
                    height: bottomRight.dy - topLeft.dy,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade400,
                      border: Border.all(color: Colors.greenAccent, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Room (${((bottomRight.dx - topLeft.dx) * (bottomRight.dy - topLeft.dy) / 10000).toStringAsFixed(1)} m²)",
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    left: -10,
                    top: -10,
                    child: _buildResizeHandle((dx, dy) {
                      setState(() {
                        topLeft = Offset(topLeft.dx + dx, topLeft.dy + dy);
                        length += dx;
                        width += dy;
                      });
                    }),
                  ),
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: _buildResizeHandle((dx, dy) {
                      setState(() {
                        bottomRight = Offset(bottomRight.dx + dx, bottomRight.dy + dy);
                        length += dx;
                        width += dy;
                      });
                    }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 150,
            child: Column(
              children: [
                _buildCircleButton(Icons.layers, "Layers"),
                _buildCircleButton(Icons.camera, "Capture"),
                _buildCircleButton(Icons.auto_fix_high, "Auto Adjust"),
                _buildCircleButton(Icons.fullscreen, "Full Screen"),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomButton(Icons.home, "Interior", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InteriorScreen()),
                    );
                  }),
                  _buildBottomButton(Icons.search, "Search", () {
                    debugPrint("Search clicked");
                  }),
                  _buildBottomButton(Icons.construction, "Construction", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConstructionScreen()), // ✅ Navigate to ConstructionScreen
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResizeHandle(Function(double, double) onDrag) {
    return GestureDetector(
      onPanUpdate: (details) {
        onDrag(details.delta.dx, details.delta.dy);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          debugPrint("$label button clicked");
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white24,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  Widget _buildBottomButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
