import 'package:flutter/material.dart';
import 'package:liver_pal/live_function_test/report_form.dart';

class LiverFunctionOverview extends StatelessWidget {
  final double ratio;
  const LiverFunctionOverview({super.key, required this.ratio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/logo.png', height: 60),
                      const SizedBox(height: 8),
                      const Text(
                        "Liver Function Test",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.warning_amber, color: Colors.orange),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Note that before liver function test, you should be fasting for at least 12 hours.",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      ratio >= 70
                          ? const Text(
                            "Based on your previous answers You’re most likely Have a liver disease",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                          : const Text(
                            "Based on your previous answers You’re not most likely Have a liver disease",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                      const SizedBox(height: 8),
                      const Text(
                        "please do some Check ups and get back to us to submit your report for further explanations .",
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LiverFunctionDataForm(),
                            ),
                          );
                        },
                        child: const Text("Add Report Result"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Medical Report Statistics",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: Center(child: Image.asset("assets/chart.png")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
