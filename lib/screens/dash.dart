import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/English_screen.dart';
import 'package:quiz_app_project/screens/History_screen.dart';
import 'package:quiz_app_project/screens/Mathematics_screen.dart';
import 'package:quiz_app_project/screens/Reasoning_screen.dart';
import 'package:quiz_app_project/screens/Science_screen.dart';
import 'package:quiz_app_project/screens/profile_screen.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue[200],
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      ),
                    ),
                    SizedBox(width: 60),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Choose your subject",
                    style: TextStyle(fontSize: 25,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  SingleChildScrollView(
                    child: Text('Decide which subject youre ready to take on !!!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    _buildSubjectButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => English_screen()
                          ),
                        );
                      },
                      image: 'https://i.ibb.co/vLh8kM2/3655598.png',
                      subjectName: 'English',
                    ),
                    _buildSubjectButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Science_screen(),
                          ),
                        );
                      },
                      image: 'https://i.ibb.co/T8LPcnY/2103473-1.png',
                      subjectName: 'Science',
                    ),
                    _buildSubjectButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Mathematics_screen(),
                          ),
                        );
                      },
                      image: 'https://i.ibb.co/Cv0Xnwx/12594067.png',
                      subjectName: 'Mathematics',
                    ),
                    _buildSubjectButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Reasoning_screen(),
                          ),
                        );
                      },
                      image: 'https://i.ibb.co/RCswttM/10523237.png',
                      subjectName: 'Reasoning',
                    ),
                    _buildSubjectButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => History_screen(),
                          ),
                        );
                      },
                      image: 'https://i.ibb.co/qJp2CC2/2682065.png',
                      subjectName: 'History',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://i.ibb.co/TKh2YMV/Screenshot-from-2024-02-05-23-33-03-removebg-preview.pnghttps://i.ibb.co/TKh2YMV/Screenshot-from-2024-02-05-23-33-03-removebg-preview.png'))
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.blue,),
              title: Text('Profile',style: TextStyle(fontSize: 15,color: Colors.blue),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite,color: Colors.blue,),
              title: Text('Bookmarks',style: TextStyle(color: Colors.blue,
              fontSize: 15),),

              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications,color: Colors.blue,),
              title: Text('Notification',style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.group,color: Colors.blue,),
              title: Text('Friends',style: TextStyle(
                color: Colors.blue
              ),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.blue,),
              title: Text('Settings',style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star,color: Colors.blue,),
              title: Text('Rate us',style: TextStyle(
                color: Colors.blue
              ),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.message,color: Colors.blue,),
              title: Text('Feedback',style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share,color: Colors.blue,),
              title: Text('Invite',style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock,color: Colors.blue,),
              title: Text('Privacy policy',style: TextStyle(
                color: Colors.blue
              ),),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue[300],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Lessons to Study',
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectButton({required VoidCallback onPressed, required String image, required String subjectName}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
          elevation: MaterialStateProperty.all(5.0),
          shadowColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.7)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(height: 10),
            Text(
              subjectName,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
