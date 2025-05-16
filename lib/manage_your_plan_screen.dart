import 'package:flutter/material.dart';

class ManageYourPlanScreen extends StatefulWidget {
  const ManageYourPlanScreen({super.key});

  @override
  ManageYourPlanScreenState createState() => ManageYourPlanScreenState();
}

class ManageYourPlanScreenState extends State<ManageYourPlanScreen> {
  bool enableFreeTrial = true;
  String selectedPlan = "Yearly Plan";

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
              // Close Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Color.fromRGBO(55, 127, 76, 1), size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Decore Version",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Choose your plan to unlock \nall features",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(55, 127, 76, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildFreeTrialSwitch(),
              const SizedBox(height: 20),
              _buildPlanOption(
                title: "Yearly Plan",
                subtitle: "12 mo EGP 1,499.99",
                price: "EGP 31.25/week",
                isSelected: selectedPlan == "Yearly Plan",
                onTap: () {
                  setState(() {
                    selectedPlan = "Yearly Plan";
                  });
                },
                showBadge: true,
              ),
              _buildPlanOption(
                title: "Weekly",
                subtitle: "",
                price: "EGP 149.99/week",
                isSelected: selectedPlan == "Weekly",
                onTap: () {
                  setState(() {
                    selectedPlan = "Weekly";
                  });
                },
                showBadge: false,
              ),
              const SizedBox(height: 30),
              // Continue Button
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
                    debugPrint("Continue button pressed with $selectedPlan");
                  },
                  child: const Text(
                    "Continue",
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

  Widget _buildFreeTrialSwitch() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Not sure yet? Enable free trial.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Switch(
            value: enableFreeTrial,
            activeColor: const Color.fromRGBO(55, 127, 76, 1),
            onChanged: (bool value) {
              setState(() {
                enableFreeTrial = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlanOption({
    required String title,
    required String subtitle,
    required String price,
    required bool isSelected,
    required VoidCallback onTap,
    required bool showBadge,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBadge)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "SAVE 81%",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                price,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
