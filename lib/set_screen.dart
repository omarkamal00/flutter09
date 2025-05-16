import 'package:flutter/material.dart';
import 'my_profile.dart';
import 'manage_your_plan_screen.dart';
import 'privacy_policy_screen.dart';
import 'about_screen.dart';
import 'sign_screen.dart';
class SetScreen extends StatelessWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 127, 76, 1), // Forest Green Background
      body: Stack(
        children: [
          // The white container for the menu
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.black, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Decor Version",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(55, 127, 76, 1),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _menuItem(Icons.person_outline, "My Profile", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyProfileScreen()),
  );
}),
                  _menuItem(Icons.card_membership, "Manage Your Plan", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ManageYourPlanScreen()),
  );
}),
                  _menuItem(Icons.privacy_tip, "Privacy Policy", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
  );
}),
                  _menuItem(Icons.info, "About", () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AboutScreen()),
  );
}),
                  _menuItem(Icons.logout, "Log Out", () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SignScreen()),
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

  Widget _menuItem(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: const Color.fromRGBO(55, 127, 76, 1), size: 24),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.green, size: 18),
          ],
        ),
      ),
    );
  }
}
