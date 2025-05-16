import 'package:flutter/material.dart';

class P2Screen extends StatefulWidget {
  const P2Screen({super.key});

  @override
  P2ScreenState createState() => P2ScreenState(); // Public state class
}

class P2ScreenState extends State<P2Screen> {
  bool generalNotification = true;
  bool sound = false;
  bool vibrate = true;
  bool appUpdates = false;
  bool billReminder = true;
  bool promotion = true;
  bool discountAvailable = false;
  bool paymentRequest = false;
  bool newServiceAvailable = false;
  bool newTipsAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Added scroll functionality
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
                  "Notifications",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(55, 127, 76, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Common"),
              _buildSwitchTile("General Notification", generalNotification, (value) {
                setState(() => generalNotification = value);
              }),
              _buildSwitchTile("Sound", sound, (value) {
                setState(() => sound = value);
              }),
              _buildSwitchTile("Vibrate", vibrate, (value) {
                setState(() => vibrate = value);
              }),
              const Divider(),
              _buildSectionTitle("System & services update"),
              _buildSwitchTile("App updates", appUpdates, (value) {
                setState(() => appUpdates = value);
              }),
              _buildSwitchTile("Bill Reminder", billReminder, (value) {
                setState(() => billReminder = value);
              }),
              _buildSwitchTile("Promotion", promotion, (value) {
                setState(() => promotion = value);
              }),
              _buildSwitchTile("Discount Available", discountAvailable, (value) {
                setState(() => discountAvailable = value);
              }),
              _buildSwitchTile("Payment Request", paymentRequest, (value) {
                setState(() => paymentRequest = value);
              }),
              const Divider(),
              _buildSectionTitle("Others"),
              _buildSwitchTile("New Service Available", newServiceAvailable, (value) {
                setState(() => newServiceAvailable = value);
              }),
              _buildSwitchTile("New Tips Available", newTipsAvailable, (value) {
                setState(() => newTipsAvailable = value);
              }),
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

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(225, 30, 127, 1)),
      ),
      activeColor: const Color.fromRGBO(55, 127, 76, 1), // Green toggle color
      value: value,
      onChanged: onChanged,
    );
  }
}
