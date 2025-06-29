import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color primaryColor = Color(0xFF4B0076);

  // Adjust if needed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(child: Image.asset('assets/logo.png', height: 80)),
                const SizedBox(height: 40),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter your personal information",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                Text("User Name"),
                const SizedBox(height: 8),
                TextField(decoration: customInputDecoration("Enter your name")),
                const SizedBox(height: 16),
                Text("Email"),
                const SizedBox(height: 8),
                TextField(decoration: customInputDecoration("email@email.com")),
                const SizedBox(height: 16),
                Text("Phone Number"),
                const SizedBox(height: 8),
                TextField(decoration: customInputDecoration("+20111928728")),
                const SizedBox(height: 16),
                Text("Password"),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: customInputDecoration(
                    "Enter password",
                  ).copyWith(suffixIcon: Icon(Icons.visibility_off)),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customInputDecoration(String hint) => InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    filled: true,
    fillColor: Colors.grey.shade100,
  );
}
