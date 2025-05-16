import 'package:flutter/material.dart';

class P3Screen extends StatefulWidget {
  const P3Screen({super.key});

  @override
  P3ScreenState createState() => P3ScreenState(); // Public state class
}

class P3ScreenState extends State<P3Screen> {
  String selectedLanguage = "English (UK)"; // Default selected language

  final List<String> suggestedLanguages = ["English (US)", "English (UK)"];
  final List<String> otherLanguages = [
    "Mandarin",
    "Hindi",
    "Spanish",
    "French",
    "Arabic",
    "Russian",
    "Indonesia",
    "Vietnamese"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Ensures page is scrollable
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
                  "Language",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(55, 127, 76, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Suggested"),
              ...suggestedLanguages.map((lang) => _buildRadioTile(lang)),
              const Divider(),
              _buildSectionTitle("Others"),
              ...otherLanguages.map((lang) => _buildRadioTile(lang)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildRadioTile(String language) {
    return RadioListTile<String>(
      title: Text(
        language,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      activeColor: const Color.fromRGBO(55, 127, 76, 1), // Green selected color
      value: language,
      groupValue: selectedLanguage,
      onChanged: (String? value) {
        setState(() {
          selectedLanguage = value!;
        });
      },
    );
  }
}
