import 'package:flutter/material.dart';
import 'dart:async'; // Importing the Timer class
import 'secure_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  int _counter = 56; // Starting value for the countdown timer
  late Timer _timer;
  bool _canResend = false; // To control the resend button availability

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Function to start the countdown timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _canResend = true;
          _timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }

  // Function to reset the timer
  void _resetTimer() {
    setState(() {
      _counter = 56;
      _canResend = false;
    });
    _startTimer();
  }

  // Move focus to the next box when a number is entered
  void _moveFocus(FocusNode currentFocus, FocusNode nextFocus) {
    if (currentFocus.hasFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter OTP Code',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Check your email inbox. Enter the one-time verification code below to proceed with resetting your password.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOTPBox(_controller1, _focusNode1, _focusNode2),
                const SizedBox(width: 10),
                _buildOTPBox(_controller2, _focusNode2, _focusNode3),
                const SizedBox(width: 10),
                _buildOTPBox(_controller3, _focusNode3, _focusNode4),
                const SizedBox(width: 10),
                _buildOTPBox(_controller4, _focusNode4, _focusNode4),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'You can resend the code in $_counter seconds',
                style: const TextStyle(fontSize: 14, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _canResend ? Colors.green : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _canResend
                    ? () {
                        _resetTimer(); // Reset the timer when Resend is clicked
                        debugPrint('OTP code resent');
                      }
                    : null, // Disable the button if timer is not 0
                child: const Text(
                  'Resend code',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                // Navigate to SecureScreen after entering OTP
                if (_controller1.text == "1" &&
                    _controller2.text == "2" &&
                    _controller3.text == "3" &&
                    _controller4.text == "4") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecureScreen(),
                    ),
                  );
                }
              },
              child: const Text(
                'Verify OTP and Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each OTP input box
  Widget _buildOTPBox(
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '',
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            _moveFocus(currentFocus, nextFocus); // Move to next box
          }
        },
      ),
    );
  }
}
