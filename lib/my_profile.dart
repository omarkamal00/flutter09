import 'package:flutter/material.dart';
import 'p1_screen.dart';
import 'p2_screen.dart';
import 'p3_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 127, 76, 1), // Forest Green Background
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.green, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "My profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(55, 127, 76, 1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/man.jpeg"), // Profile image
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Andrew",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                 _profileItem("Edit profile information", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const P1Screen()),
  );
}),
                  _profileItem("Notifications", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const P2Screen()),
  );
}),
                  _profileItem("Language", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const P3Screen()),
  );
}),
                  _profileItem("Report a problem", () {
                    debugPrint("Report a problem clicked");
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileItem(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color.from(alpha: 1, red: 0.361, green: 1, blue: 0.2), size: 18),
          ],
        ),
      ),
    );
  }
}
