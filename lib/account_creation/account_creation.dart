import 'package:flutter/material.dart';
import 'package:liver_pal/login/login.dart';
import 'package:liver_pal/login/rigester.dart';

class AccountCreation extends StatelessWidget {
  const AccountCreation({super.key});

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
            child: Image(image: AssetImage("assets/logincr.png")),
          ),
          SizedBox(height: 80),
          SizedBox(
            width: w / 1.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Login", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(
                16,
              ), // Optional: rounded corners
            ),
            child: SizedBox(
              width: w / 1.1,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                minWidth: double.infinity,
                height: 50,
                color: Colors.white,
                elevation: 0,
                child: Text("Register", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
