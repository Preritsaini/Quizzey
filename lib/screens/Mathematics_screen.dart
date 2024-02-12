import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/Wronganswer_screen.dart';
import 'package:quiz_app_project/screens/dash.dart';
class Mathematics_screen extends StatefulWidget {
  const Mathematics_screen({Key? key}) : super(key: key);

  @override
  State<Mathematics_screen> createState() => _MathematicsScreenState();
}

class _MathematicsScreenState extends State<Mathematics_screen> {
  // List of questions
  final List<String> questions = [
    "What is the sum of 130+125+191?",
    "If we substract 712 from 1500,how much do we get?",
    "50 times 8 is equal to?",
    "110 devided by 10 is ?",
    "The product of 82 and 5 is",
  ];

  final List<List<String>> options = [
    ['446', '335', '444', '123'],
    ['788', '778', '123', '768'],
    ['400', '200', '100', '500'],
    ['11', '10', '1', '300'],
    ['410', '400', '10', '111'],
  ];

  final List<int?> selectedOptions = List.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mathematics"),
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
                              // Do something when the correct answer is selected
                              // For example, change the color or provide feedback
                            } else {
                              // Navigate to a screen for the wrong answer
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
    return selectedOptionIndex == questionIndex;
  }
}
