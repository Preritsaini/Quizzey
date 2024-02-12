import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/Wronganswer_screen.dart';
import 'package:quiz_app_project/screens/dash.dart';
class History_screen extends StatefulWidget {
  const History_screen({Key? key}) : super(key: key);

  @override
  State<History_screen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<History_screen> {
  // List of questions
  final List<String> questions = [
    "How many age does the history divided",
    "Who among the following ruler was defeated by soleucus?",
    "Who wrote vande matram'?",
    "Where did tebhega movement occur'?",
    "Where is battlefield of plassey situated?",
  ];

  final List<List<String>> options = [
    ['3', '4', '1', 'O'],
    [ 'Babar','Chandra Gupta maurya', 'Akbar', 'Chanakya'],
    [ 'Ravindra nath tagore', 'S.C chattopadhay','Bankim Chandra Chatarjee', 'none of these'],
    [ 'Orrisa', '  Maharastra', 'Odisa','Bengal',],
    ['rajasthan', 'Haryana', 'Odisa', 'Uttar pradesh','West bengal',],
  ];

  final List<int?> selectedOptions = List.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("History"),
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
                builder: (context) =>Dash(),
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
