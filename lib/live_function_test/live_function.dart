import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liver_pal/live_function_test/report_form.dart';
import 'package:path/path.dart';

class LiverFunctionScreen extends StatefulWidget {
  final int normal;

  const LiverFunctionScreen({super.key, required this.normal});

  @override
  State<LiverFunctionScreen> createState() => _LiverFunctionScreenState();
}

class _LiverFunctionScreenState extends State<LiverFunctionScreen> {
  int? cls; // Change from String to int? for numeric logic
  bool isLoading = false;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add logo if desired
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Liver Function Test",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Liver Function",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    widget.normal == 0
                                        ? Colors.green
                                        : Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.normal == 0 ? "Normal" : "Abnormal",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              widget.normal == 0
                                  ? const TextSpan(text: "You Don't have a ")
                                  : const TextSpan(
                                    text: "You have a liver disease ",
                                  ),
                              const TextSpan(
                                text: "Fatty Liver disease",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Please don’t forget to get regular checkups.",
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LiverFunctionDataForm(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Update Test Result",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Ultrasound liver with focal lesion assessment",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child:
                        widget.normal == 0
                            ? Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Liver Functions",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "This Week",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 80),
                                const Text(
                                  "100.000,00",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Center(
                                    child: Image.asset(
                                      "assets/chart.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            )
                            : Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Ultrasound Liver results",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              cls == 0
                                                  ? Colors.green
                                                  : Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          cls == 0
                                              ? "Normal"
                                              : cls == null
                                              ? "Unknown"
                                              : "Abnormal",
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: [
                                        cls == 0
                                            ? const TextSpan(
                                              text:
                                                  "You don't have a Liver Disease.",
                                            )
                                            : TextSpan(
                                              text:
                                                  cls == null
                                                      ? "No result yet"
                                                      : "Class $cls",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple,
                                              ),
                                            ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Please don’t forget to get regular checkups.",
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed:
                                          isLoading
                                              ? null
                                              : () async {
                                                setState(() {
                                                  isLoading = true;
                                                });

                                                var result =
                                                    await pickImageAndUpload();

                                                setState(() {
                                                  isLoading = false;
                                                });

                                                if (result != null &&
                                                    int.tryParse(result) !=
                                                        null) {
                                                  int s = int.parse(result);
                                                  setState(() {
                                                    cls = s;
                                                  });
                                                } else {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        result ?? "Error",
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Upload Image",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Future<String?> pickImageAndUpload() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      var uri = Uri.parse('http://168.231.124.22:8000/predict/image');
      var request = http.MultipartRequest('POST', uri);

      Uint8List bytes = await pickedFile.readAsBytes();

      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: basename(pickedFile.path),
          contentType: MediaType('image', 'jpeg'),
        ),
      );
      try {
        http.StreamedResponse response = await request.send();

        String res = await response.stream.bytesToString();
        debugPrint('Raw response: $res');

        if (response.statusCode == 200) {
          var decoded = jsonDecode(res);
          int predictedClass = decoded['class'];
          return predictedClass.toString();
        } else {
          return 'Error ${response.statusCode}: $res';
        }
      } catch (e) {
        return 'Exception: $e';
      }
    } else {
      return 'No image selected.';
    }
  }
}
