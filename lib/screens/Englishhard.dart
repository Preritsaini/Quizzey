import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:quiz_app_project/screens/Wronganswer_screen.dart';
import 'package:quiz_app_project/screens/dash.dart';

class EnglishHard extends StatefulWidget {
  const EnglishHard({Key? key}) : super(key: key);

  @override
  State<EnglishHard> createState() => _EnglishHardState();
}

class _EnglishHardState extends State<EnglishHard> {
  // List of questions
  final List<String> questions = [
    "Which sentence is grammatically correct?",
    "Identify the sentence with proper subject-verb agreement:",
    "Choose the correct use of the apostrophe:",
    "Select the sentence with the appropriate use of the comparative form:",
    "Identify the correct sentence with proper pronoun usage:",
  ];

  final List<List<String>> options = [
    ['a) She don\'t like pizza.', 'b) She doesn\'t like pizza.', 'c) She not likes pizza.', 'd) She not liking pizza.'],
    ['a) The team are playing well.', 'b) The team is playing well.', 'c) The team am playing well.', 'd) The team be playing well.'],
    ['a) The cats food bowl is empty.', 'b) The cat\'s food bowl is empty.', 'c) The cats\' food bowl is empty.', 'd) The cats\'s food bowl is empty.'],
    ['a) This book is more interesting than the first one.', 'b) This book is interesting as the first one.', 'c) This book is interesting than the first one.', 'd) This book is interesting more than the first one.'],
    ['a) My sister and me are going to the park.', 'b) My sister and I are going to the park.', 'c) Me and my sister are going to the park.', 'd) Me and my sister is going to the park.'],
  ];

  final List<int?> selectedOptions = List.filled(5, null);
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        centerTitle: true,
        title: Text("English Hard"),
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
