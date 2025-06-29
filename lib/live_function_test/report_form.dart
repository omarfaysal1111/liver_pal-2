import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liver_pal/live_function_test/live_function.dart';
import 'package:liver_pal/main_navigation.dart';

class LiverFunctionDataForm extends StatefulWidget {
  const LiverFunctionDataForm({super.key});

  @override
  State<LiverFunctionDataForm> createState() => _LiverFunctionDataFormState();
}

class _LiverFunctionDataFormState extends State<LiverFunctionDataForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  String gender = "Female";

  final TextEditingController totBilController = TextEditingController();
  final TextEditingController dirBilController = TextEditingController();
  final TextEditingController alkPhosController = TextEditingController();
  final TextEditingController altController = TextEditingController();
  final TextEditingController astController = TextEditingController();
  final TextEditingController totProController = TextEditingController();
  final TextEditingController albController = TextEditingController();
  final TextEditingController agRatioController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    totBilController.dispose();
    dirBilController.dispose();
    alkPhosController.dispose();
    altController.dispose();
    astController.dispose();
    totProController.dispose();
    albController.dispose();
    agRatioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liver Function Test Input")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _numberField("Age", ageController),
              const SizedBox(height: 10),
              _genderDropdown(),
              const SizedBox(height: 10),
              _numberField("Total Bilirubin (Tot_Bil)", totBilController),
              _numberField("Direct Bilirubin (Dir_Bil)", dirBilController),
              _numberField(
                "Alkaline Phosphotase (Alk_Phos)",
                alkPhosController,
              ),
              _numberField("Alanine Aminotransferase (ALT)", altController),
              _numberField("Aspartate Aminotransferase (AST)", astController),
              _numberField("Total Proteins (Tot_pro)", totProController),
              _numberField("Albumin (Alb)", albController),
              _numberField(
                "Albumin/Globulin Ratio (A/G Ratio)",
                agRatioController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var headers = {
                      'accept': 'application/json',
                      'Content-Type': 'application/json',
                    };

                    var request = http.Request(
                      'POST',
                      Uri.parse(
                        'http://10.0.2.2:8000/predict/tabular',
                      ), // or use local IP if on device
                    );

                    request.body = json.encode({
                      "age": int.tryParse(ageController.text),
                      "gender": gender,
                      "Tot_Bil": double.tryParse(totBilController.text),
                      "Dir_Bil": double.tryParse(dirBilController.text),
                      "Alk_Phos": double.tryParse(alkPhosController.text),
                      "ALT": double.tryParse(altController.text),
                      "AST": double.tryParse(astController.text),
                      "Tot_pro": double.tryParse(totProController.text),
                      "Alb": double.tryParse(albController.text),
                      "A_G_Ratio": double.tryParse(agRatioController.text),
                    });

                    request.headers.addAll(headers);

                    http.StreamedResponse response = await request.send();

                    if (response.statusCode == 200) {
                      // Convert the stream to string then decode JSON
                      String responseBody =
                          await response.stream.bytesToString();
                      final decoded = json.decode(responseBody);

                      String prediction = decoded["prediction"];
                      print("Prediction result: $prediction");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => LiverFunctionScreen(
                                normal:
                                    prediction == "No Liver Disease" ? 0 : 1,
                              ),
                        ),
                      );
                    } else {
                      print(
                        "Error: ${response.statusCode} ${response.reasonPhrase}",
                      );
                    }
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Required";
          return null;
        },
      ),
    );
  }

  Widget _genderDropdown() {
    return DropdownButtonFormField<String>(
      value: gender,
      decoration: const InputDecoration(
        labelText: "Gender",
        border: OutlineInputBorder(),
      ),
      items:
          ["Male", "Female"].map((g) {
            return DropdownMenuItem(value: g, child: Text(g));
          }).toList(),
      onChanged: (val) {
        setState(() {
          gender = val!;
        });
      },
    );
  }
}
