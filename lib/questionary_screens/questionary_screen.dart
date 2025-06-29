import 'package:flutter/material.dart';
import 'package:liver_pal/live_function_test/liver_diseas.dart';

List<String> questions = [
  "Have you been experiencing persistent or unusual fatigue or low energy levels?",
  "Have you noticed any unexplained weight loss recently?",
  "Have you experienced a loss of appetite or frequent nausea?",
  "Do you often feel bloated or have discomfort in your abdomen?",
  "Have you noticed any yellowing of your skin or the whites of your eyes?",
  "Has there been any change in your urine (for example, darker color) or your stool (for example, lighter or clay-colored)?",
  "Do you experience pain or a feeling of fullness in the upper right side of your abdomen (just under your rib cage)?",
  "Have you noticed any swelling in your abdomen?",
  "Have you had any persistent or unusual itching without an obvious cause?",
  "Do you consume alcohol? If yes, how frequently and in what amounts?",
  "Are you taking any medications or supplements that you know may affect your liver?",
  "Have you ever been diagnosed with hepatitis or any other liver conditions?",
  "Is there a history of liver disease in your family?",
  "Have you been exposed to any known risk factors for liver disease (such as recent contact with someone diagnosed with hepatitis, blood transfusions, or intravenous drug use)?",
  "Have you noticed that you bruise easily or experience unexplained bleeding (e.g., frequent nosebleeds or bleeding gums)?",
  "Have you experienced swelling in your legs, ankles, or even in your abdomen (which might suggest fluid retention or ascites)?",
];

int qIndex = 0;
int yes = 0;
int no = 0;

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int selectedOption = -1;

  final List<String> answers = ["yes", "no"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Now to complete your profile",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "please help us by answering these questions",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${qIndex + 1}/${questions.length}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        questions[qIndex],
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 24),
                    ...List.generate(answers.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                value: index,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value as int;
                                  });
                                },
                                activeColor: Colors.deepPurple,
                              ),
                              Text(answers[index]),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        if (qIndex < questions.length - 1) {
                          setState(() {
                            qIndex++;
                          });

                          if (selectedOption == 0) {
                            setState(() {
                              yes++;
                            });
                          } else {
                            setState(() {
                              no++;
                            });
                          }
                        } else {
                          double ratio = yes / 16 * 100;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      LiverFunctionOverview(ratio: ratio),
                            ),
                          );
                        }
                        // Navigate to next question or handle submission
                      },
                      child: Text("Next"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
