import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/dash.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(" User Profile",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),)

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Prerit Saini',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'sainiprerit6@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){}, child: Text("Scores",
                style: TextStyle(
                  color: Colors.blue,fontWeight: FontWeight.bold,
                  fontSize: 20
                ),)),
                TextButton(onPressed: (){}, child: Text("Share profile ",
                  style: TextStyle(
                      color: Colors.blue,fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),))
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for editing profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      )
    );
  }
}
