import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/Englisheasy.dart';
import 'package:quiz_app_project/screens/Englishhard.dart';
import 'package:quiz_app_project/screens/Englishintermidiate.dart';

class English_screen extends StatefulWidget {
  const English_screen({Key? key}) : super(key: key);

  @override
  State<English_screen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<English_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text("English"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 1000,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.ibb.co/NWtMNH4/Screenshot-from-2024-02-05-23-41-57.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Decide your tier ! ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.blue[900],
                    fontFamily: ('MiltonianTattoo')
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Englisheasy(),
                  ),
                );

              },
              child: Container(
                height: 50,
                width: 200,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: Colors.blue[500],
              ),
                child: Center(child: Text("Easy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),)),
              ),
            ),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EnglishIntermidiate(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.blue[500]
                ),
                child: Center(child: Text("Intermediate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),)),
              ),
            ),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EnglishHard(),
                  ),
                );

              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.blue[500]
                ),
                child: Center(child: Text("Hard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
