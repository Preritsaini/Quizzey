import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:quiz_app_project/screens/Wronganswer_screen.dart';
import 'package:quiz_app_project/screens/dash.dart';

class EnglishIntermidiate extends StatefulWidget {
  const EnglishIntermidiate({Key? key}) : super(key: key);

  @override
  State<EnglishIntermidiate> createState() => _EnglishIntermidiateState();
}

class _EnglishIntermidiateState extends State<EnglishIntermidiate> {
  // List of questions
  final List<String> questions = [
    "Choose the correct form of the verb to complete the sentence.\nI ___ my keys on the kitchen counter.",
    "Identify the pronoun in the following sentence:\nSheila baked a cake for her brother's birthday.",
    "Which sentence is in the past tense?",
    "Select the correct form of the comparative adjective:\nThis mountain is ___ than the one we climbed last year.",
    "Identify the conjunction in the sentence:\nI wanted to go to the party, but I had too much homework.",
  ];

  final List<List<String>> options = [
    ['a) leave', 'b) leaves', 'c) left', 'd) leaving'],
    ['a) Sheila', 'b) baked', 'c) cake', 'd) brother\'s'],
    ['a) The sun is shining brightly today.', 'b) Sarah will go to the store after work.', 'c) I am going to the beach tomorrow.', 'd) The cat chased the mouse.'],
    ['a) tall', 'b) taller', 'c) tallest', 'd) more tall'],
    ['a) wanted', 'b) party', 'c) but', 'd) too much'],
  ];

  final List<int?> selectedOptions = List.filled(5, null);
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        centerTitle: true,
        title: Text("English"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountdownTimer(
                endTime: DateTime.now().millisecondsSinceEpoch + 30000,
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  if (time == null) {
                    return Text("Time's up!");
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.teal[700],
                        radius: 70,
                        child: Text(
                          '${time.sec}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                "Question ${currentQuestionIndex + 1}:\n${questions[currentQuestionIndex]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 20),
              // Create MaterialButton for each option
              ...List.generate(
                options[currentQuestionIndex].length,
                    (optionIndex) {
                  return MaterialButton(
                    onPressed: () {
                      setState(() {
                        selectedOptions[currentQuestionIndex] = optionIndex;
                      });

                      if (!isAnswerCorrect(currentQuestionIndex, optionIndex)) {
                        // Set the selected option as wrong
                        selectedOptions[currentQuestionIndex] = -1;
                      }
                    },
                    color: selectedOptions[currentQuestionIndex] == optionIndex
                        ? isAnswerCorrect(currentQuestionIndex, optionIndex)
                        ? Colors.green // Correct answer color
                        : Colors.red // Wrong answer color
                        : null, // Default color
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.teal[700],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          options[currentQuestionIndex][optionIndex],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Check if an option is selected before moving to the next question
          if (selectedOptions[currentQuestionIndex] != null) {
            // Move to the next question
            setState(() {
              currentQuestionIndex++;
              // Clear the selected option for the next question
              selectedOptions[currentQuestionIndex] = null;
            });

            // Check if it's the last question
            if (currentQuestionIndex == questions.length) {
              // Navigate to the result screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(),
                ),
              );
            }
          } else {
            // Show a message or alert that an option must be selected
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please select an option before moving to the next question.'),
              ),
            );
          }
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.teal[700],
      ),
    );
  }

  bool isAnswerCorrect(int questionIndex, int selectedOptionIndex) {
    return selectedOptionIndex == questionIndex;
  }
}

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        centerTitle: true,
        title: Text("Results"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulations! You have completed the quiz.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen
                Navigator.pop(context);
              },
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
