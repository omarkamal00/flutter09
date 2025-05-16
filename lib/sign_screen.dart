import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import SignUpScreen
import 'signin_screen.dart'; // Import SignInScreen

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's Get Started!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Let's dive into your account",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            SocialButton(
              image: 'assets/images/g.view.png',
              text: 'Continue with Google',
              onPressed: () {
                debugPrint('Google button pressed');
                // Add Google Sign-in functionality here
              },
            ),
            SocialButton(
              image: 'assets/images/a.view.png',
              text: 'Continue with Apple',
              onPressed: () {
                debugPrint('Apple button pressed');
                // Add Apple Sign-in functionality here
              },
            ),
            SocialButton(
              image: 'assets/images/f.view.png',
              text: 'Continue with Facebook',
              onPressed: () {
                debugPrint('Facebook button pressed');
                // Add Facebook Sign-in functionality here
              },
            ),
            SocialButton(
              image: 'assets/images/t.view.jpg',
              text: 'Continue with Twitter',
              onPressed: () {
                debugPrint('Twitter button pressed');
                // Add Twitter Sign-in functionality here
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Navigate to SignInScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Navigate to SignUpScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        icon: Image.asset(image, width: 24, height: 24),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
