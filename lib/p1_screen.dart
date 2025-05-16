import 'package:flutter/material.dart';
import 'my_profile.dart'; // Import MyProfileScreen

class P1Screen extends StatelessWidget {
  const P1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Added scrolling
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(55, 127, 76, 1), size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Edit profile",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(55, 127, 76, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("Full name", "Andrew"),
              _buildTextField("Nick name", "puerto_rico"),
              _buildTextField("Label", "andrew@yourdomain.com"),
              _buildTextField("Phone number", "123-456-7890", prefixIcon: Icons.flag), // Flag Placeholder
              Row(
                children: [
                  Expanded(child: _buildDropdownField("Country", "United States")),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTextField("Genre", "Male")),
                ],
              ),
              _buildTextField("Address", "45 New Avenue, New York"),
              const SizedBox(height: 30),
              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyProfileScreen()),
                    );
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, {IconData? prefixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6), // Reduced spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)), // Smaller label
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.green) : null,
            ),
            controller: TextEditingController(text: value),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6), // Reduced spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)), // Smaller label
          const SizedBox(height: 4),
          DropdownButtonFormField(
            value: value,
            items: const [
              DropdownMenuItem(value: "United States", child: Text("United States")),
              DropdownMenuItem(value: "Canada", child: Text("Canada")),
              DropdownMenuItem(value: "UK", child: Text("UK")),
            ],
            onChanged: (value) {
              debugPrint("Country selected: $value");
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
