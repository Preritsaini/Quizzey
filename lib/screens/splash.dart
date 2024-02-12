import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/dash.dart';

class Splashscreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 300,
                width: 1000,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://i.ibb.co/7Qb6TtT/Free-Vector-Character-playing-videogame-removebg-preview.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                ),
              ),
            SizedBox(height: 10),
            Text('Quizzey',
            style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,
            color: Colors.blue[900],
            fontFamily: 'MiltonianTattoo'),),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 10),
                Text('Let\'s Play',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue[900]
                ),),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(width: 10),
                  ],
                ),
                Text('Quiz is a very popular powerful activity that can ',style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 12),
                Text( 'meet many teaching needs,from simple,multple-',style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),),
              ],
            ),
            Row(
              children: [
                SizedBox(width:8),
                Text(' choice knowledge test to complex,self-assesment ',style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),),
              ],
            ),
            Row(
              children: [
                SizedBox(width:12),
                Text('tasks with detailed feedback',style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 10),
                Text('Name',
                style: TextStyle(color: Colors.blue[900],
                fontSize: 29,fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ), // Set hint text color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Dash(),
                  ),
                );

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0), // Set border radius here
                  color: Colors.blue[900],
                ),
                height: 50,
                width: 170,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Play",
                      style: TextStyle(color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
