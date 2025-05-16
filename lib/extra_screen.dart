import 'package:flutter/material.dart';

class ExtraScreen extends StatelessWidget {
  final bool isFirstImage;

  const ExtraScreen({super.key, required this.isFirstImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isFirstImage
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/4.jpg',
                            fit: BoxFit.cover,
                            height: 300,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Survey Reveals User Views on AI in Interior Design',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'We\'ve recently asked 2,626 Planner 5D users about their views on AI\'s role in interior design. Here is what they said, from ranking their favorite tools to how frequently they use them for interior design.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'In today\'s digital landscape, artificial intelligence (AI) has been transforming many industries across the board. The interior design world is no exception. A recent study by Planner 5D reveals that a staggering 85.4% of people are now using AI to design their homes, with 29.7% incorporating it into their weekly routine.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/3.jpg',
                            fit: BoxFit.cover,
                            height: 300,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '16 Barndominium Interior Design Ideas and Tips',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Barndominiums, or barndos as they\'re known, have risen in popularity in the last few years. They combine the rustic charm of traditional barns with the comfort and style of contemporary living. They are especially popular in the US and Canada, appealing to homeowners who desire spacious, functional, visually appealing designs.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'In this post, we explore various barndominium interior ideas, what they are and what makes them so appealing. You\'ll also discover ideas for how to customize these homes and make the most of the space.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
