import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/Wronganswer_screen.dart';
import 'package:quiz_app_project/screens/dash.dart';
class Science_screen extends StatefulWidget {
  const Science_screen({Key? key}) : super(key: key);

  @override
  State<Science_screen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<Science_screen> {
  // List of questions
  final List<String> questions = [
    "What is the source of energy for producers?",
    "What kind of organism comes last in food chain?",
    "Transpiration in plant is responsible for ",
    "When plants perform photosynthesis ,What substance is produced?",
    "Plants are called",
  ];

  final List<List<String>> options = [
    ['Sun', 'Earth', 'Wind', 'none of these'],
    ['Decomposers', 'Omniveres', 'Consumers', 'Producers'],
    ['Releasing of water', 'Making of food', 'Losing food', 'Making of water'],
    ['Oxygen and glucose', 'Water', 'Nitrogen', 'Argon'],
    ['Producers', 'Herbivores', 'Omniveres', 'none of these'],
  ];

  final List<int?> selectedOptions = List.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Science"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/1200/900'), // Add your image asset path
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
    return selectedOptionIndex == questionIndex;
  }
}
