import 'package:flutter/material.dart';
import 'extra_screen.dart';  // Import ExtraScreen
import 'camera_screen.dart'; // Import Camera Screen
import 'bot_screen.dart'; // Import Bot Screen
import 'set_screen.dart'; // Import SetScreen
import 'myroom0_screen.dart'; // Import MyRoomScreen
import 'tools_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.green),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SetScreen()),
            );
          },
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.green, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 127, 76, 1), // Forest Green
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Room',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Tap to get started',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyRoomScreen()),
                          );
                        },
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.add, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'My Projects',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProjectCard(imagePath: 'assets/images/2.jpg', title: 'Elegant Design Retreat'),
                    ProjectCard(imagePath: 'assets/images/1.jpg', title: 'Modern Open Kitchen Design'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Inspiration',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExtraScreen(isFirstImage: true),
                          ),
                        );
                      },
                      child: InspirationCard(
                        imagePath: 'assets/images/4.jpg',
                        title: 'Survey Reveals User Views on AI in Interior Design',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExtraScreen(isFirstImage: false),
                          ),
                        );
                      },
                      child: InspirationCard(
                        imagePath: 'assets/images/3.jpg',
                        title: '16 Barndominium Interior Design Ideas and Tips',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
  color: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: const Icon(Icons.home, color: Colors.green, size: 40),
        onPressed: () {}, // This keeps you on HomeScreen
      ),
      FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
        backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
      IconButton(
        icon: const Icon(Icons.build, color: Colors.grey, size: 40), // Change color to green if needed
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ToolsScreen()), // Link to ToolsScreen
          );
        },
      ),
    ],
  ),
),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BotScreen()),
            );
          },
          child: const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/bot.jpg'),
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ProjectCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150,
              width: 200,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class InspirationCard extends ProjectCard {
  const InspirationCard({super.key, required super.imagePath, required super.title});
}
