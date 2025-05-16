import 'package:flutter/material.dart';
import 'camera_screen.dart'; // Import Camera Screen
import 'home_screen.dart'; // Import Home Screen
import 'DesignGenerator_screen.dart'; // Import Design Generator Screen
import 'bot_screen.dart'; // Import Bot Screen

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Customer Tools',
          style: TextStyle(color: Colors.green, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Discover tools to improve your house.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildToolButton('Assistant', Icons.chat_bubble_outline, context, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BotScreen()),
                    );
                  }),
                  _buildToolButton('Design Generator', Icons.auto_fix_high, context, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DesignGeneratorScreen()),
                    );
                  }),
                  _buildToolButton('Wallpaper Try On', Icons.format_paint, context, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CameraScreen()),
                    );
                  }),
                  _buildToolButton('AR Try On', Icons.view_in_ar, context, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CameraScreen()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildToolButton(String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(55, 127, 76, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.green, size: 40),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CameraScreen()));
            },
            backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.build, color: Colors.green, size: 40),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ToolsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
