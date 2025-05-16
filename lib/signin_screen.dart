import 'package:flutter/material.dart';
import 'forget_password_screen.dart'; // Import ForgetPasswordScreen
import 'home_screen.dart'; // Import HomeScreen for navigation

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false; // To toggle password visibility
  bool _rememberMe = false; // To track the checkbox state

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
              "Welcome Back!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please sign in to continue",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Password",
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
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
                // Navigate to HomeScreen after sign in
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(), // Navigate to HomeScreen
                  ),
                );
              },
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value:
                          _rememberMe, // Bind the checkbox value to the variable
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!; // Update checkbox state
                        });
                      },
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to ForgetPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'or',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  image: 'assets/images/g.view.png', // Google Image
                  onPressed: () {
                    debugPrint('Google Sign-in pressed');
                  },
                ),
                const SizedBox(width: 10),
                SocialButton(
                  image: 'assets/images/a.view.png', // Apple Image
                  onPressed: () {
                    debugPrint('Apple Sign-in pressed');
                  },
                ),
                const SizedBox(width: 10),
                SocialButton(
                  image: 'assets/images/f.view.png', // Facebook Image
                  onPressed: () {
                    debugPrint('Facebook Sign-in pressed');
                  },
                ),
                const SizedBox(width: 10),
                SocialButton(
                  image: 'assets/images/t.view.jpg', // Twitter Image
                  onPressed: () {
                    debugPrint('Twitter Sign-in pressed');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;

  const SocialButton({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        minimumSize: const Size(
          50,
          50,
        ), // Adjust button size to fit smaller circles
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onPressed,
      icon: Container(
        width:
            30, // Ensure the width is small and proportional to the image size
        height: 30, // Height equal to width for a perfect circle
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
            fit:
                BoxFit
                    .cover, // Ensures the image fits perfectly inside the circle
          ),
        ),
      ),
      label: const SizedBox.shrink(), // Empty label
    );
  }
}
