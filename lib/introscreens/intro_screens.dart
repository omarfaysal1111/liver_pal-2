import 'package:flutter/material.dart';
import 'package:liver_pal/account_creation/account_creation.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

List<String> images = ['first.png', 'second.png', 'third.png'];
List<String> texts = [
  "Automatically analyzes lab tests and imaging",
  "interactive chatbot",

  "cooking recipes for liver patients, educational articles, and videos",
];
int imgIndex = 0;

class _IntroScreensState extends State<IntroScreens> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: w,
            height: 402 / 874 * h,
            child: Image(image: AssetImage("assets/${images[imgIndex]}")),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: w / 1.1,
                  child: Text(
                    texts[imgIndex],
                    style: TextStyle(
                      color: Colors.black,
                      textBaseline: TextBaseline.alphabetic,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 200),
          SizedBox(
            width: w / 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                if (imgIndex < images.length - 1) {
                  setState(() {
                    imgIndex++;
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountCreation()),
                  );
                }
              },
              child: Text("Next", style: TextStyle(color: Colors.white)),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              setState(() {
                // imgIndex++;
              });
            },
            child: Text("Skip"),
          ),
        ],
      ),
    );
  }
}
