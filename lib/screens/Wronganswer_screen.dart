import 'package:flutter/material.dart';
import 'package:quiz_app_project/screens/dash.dart';

class Wronganswer_screen extends StatefulWidget {
  const Wronganswer_screen({Key? key}) : super(key: key);

  @override
  State<Wronganswer_screen> createState() => _Wronganswer_screenState();
}

class _Wronganswer_screenState extends State<Wronganswer_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      body: SafeArea(child:
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 350,
            color: Colors.red,
            child: Text("  oops ! Your answer is wrong",
            style: TextStyle(
              fontSize: 25
            )),
          ),
          TextButton(onPressed:(){
            Navigator.of(context).pop((context),

            );

          } , child: Text("Click to try again",
              style: TextStyle(
                  fontSize: 40
              ))
          )
        ],
      ))),
    );
  }
}
