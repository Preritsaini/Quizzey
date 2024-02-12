// Your updated code with improvements

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Englisheasy extends StatefulWidget {
  const Englisheasy({Key? key}) : super(key: key);

  @override
  State<Englisheasy> createState() => _EnglisheasyState();
}

class _EnglisheasyState extends State<Englisheasy> {
  // List of questions
  final List<String> questions = [
    "Which of the following is not a vowel",
    "Which is not a preposition?",
    "Who wrote Romeo and Juliet?",
    "Where did the bhega movement occur?",
    "Where is the battlefield of Plassey situated?",
  ];

  final List<List<String>> options = [
    ['P', 'A', 'E', 'O'], // Options for question 1
    ['at', 'way', 'in', 'over'], // Options for question 2
    ['Ravindra Nath Tagore', 'S.C Chattopadhay', 'William Shakespeare', 'none of these'], // Options for question 3
    ['Maharashtra', 'Odisha', 'Bengal', 'Uttar Pradesh'], // Options for question 4
    ['Rajasthan', 'Haryana', 'Odisha', 'Uttar Pradesh', 'West Bengal'], // Options for question 5
  ];

  final List<int?> selectedOptions = List.filled(5, null);
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        centerTitle: true,
        title: Text("Let\'s Play"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[700],
                            radius: 20,
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
                  Row(
                    children: [
                      SizedBox(width: 100),
                      Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://i.ibb.co/k8Rt1ZZ/Screenshot-from-2024-02-05-23-56-01-removebg-preview.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'English Quiz',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Question ${currentQuestionIndex + 1}:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    questions[currentQuestionIndex],
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  // Create MaterialButton for each option
                  ...List.generate(
                    options[currentQuestionIndex].length,
                        (optionIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedOptions[currentQuestionIndex] =
                                  optionIndex;
                            });

                            if (!isAnswerCorrect(
                                currentQuestionIndex, optionIndex)) {
                              // Set the selected option as wrong
                              selectedOptions[currentQuestionIndex] = -1;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedOptions[currentQuestionIndex] ==
                                optionIndex
                                ? isAnswerCorrect(currentQuestionIndex,
                                optionIndex)
                                ? Colors.green // Correct answer color
                                : Colors.red // Wrong answer color
                                : Colors.blue[700], // Default color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            minimumSize: Size(150, 50),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: Center(
                              child: Text(
                                options[currentQuestionIndex][optionIndex],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white, // Text color
                                ),
                              ),
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentQuestionIndex == questions.length - 1 &&
              selectedOptions.every((option) => option != null)) {
            // Navigate to the result screen if all questions have been answered
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  questions: questions,
                  selectedOptions: selectedOptions,
                  options: options,
                ),
              ),
            );
          } else {
            if (selectedOptions[currentQuestionIndex] != null) {
              setState(() {
                currentQuestionIndex++;
                // Clear the selected option for the next question
                selectedOptions[currentQuestionIndex] = null;
              });
            } else {
              // Show a message or alert that an option must be selected
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Please select an option before moving to the next question.'),
                ),
              );
            }
          }
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.blue[400],
      ),
    );
  }

  bool isAnswerCorrect(int questionIndex, int selectedOptionIndex) {
    return selectedOptionIndex == questionIndex;
  }
}

class ResultScreen extends StatelessWidget {
  final List<String> questions;
  final List<int?> selectedOptions;
  final List<List<String>> options;

  const ResultScreen({
    required this.questions,
    required this.selectedOptions,
    required this.options,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        title: Text("Quiz Results"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage('https://i.ibb.co/c1QH3V3/Screenshot-from-2024-02-08-21-43-35-removebg-preview.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Congratulations! You have completed the quiz.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            questions[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Answer: ${options[index][selectedOptions[index] ?? -1]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Correct Answer: ${options[index][index]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Back to Home"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Englisheasy(),
  ));
}
