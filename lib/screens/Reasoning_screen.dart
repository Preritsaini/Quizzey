import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/Wronganswer_screen.dart';
import 'package:quiz_app_project/screens/dash.dart';
class Reasoning_screen extends StatefulWidget {
  const Reasoning_screen({Key? key}) : super(key: key);

  @override
  State<Reasoning_screen> createState() => _ReasoningScreenState();
}

class _ReasoningScreenState extends State<Reasoning_screen> {
  // List of questions
  final List<String> questions = [
    "Complete the series 1,6,13,22,33",
    "Complete the series 3,7 23,95",
    "Complete the series 7,26,63,124,215,342",
    "Complete the series 165,195,255,345",
    "Complete the series 9,17,33,65",
  ];

  final List<List<String>> options = [
    ['46', '48', '49', 'none of these'],
    ['479', '455', '111', '575'],
    ['511', '123', '333', '334'],
    ['435', '390', '420', '123'],
    ['129', '22', '67', 'none of these'],
  ];

  final List<int?> selectedOptions = List.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reasoning"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(''), // Add your image asset path
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${index + 1}:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(questions[index], style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    // Create ElevatedButton for each option
                    ...List.generate(
                      options[index].length,
                          (optionIndex) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedOptions[index] = optionIndex;
                            });

                            if (isAnswerCorrect(index, optionIndex)) {
                              } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Wronganswer_screen(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedOptions[index] == optionIndex
                                ? Colors.green // Selected option color
                                : null, // Default color
                          ),
                          child: Text(
                            options[index][optionIndex],
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Dash(),
              ),
            );

          },
          child: Text("Home"),
        ),
      ),
    );
  }

  bool isAnswerCorrect(int questionIndex, int selectedOptionIndex) {
    return selectedOptionIndex == 0;
  }
}
