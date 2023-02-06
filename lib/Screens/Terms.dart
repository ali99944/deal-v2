
import 'package:deal/Screens/DrawerScreen.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Terms And Conditions')),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: DrawerScreen() ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Terms And Conditions",
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline

              ),
            ),
            Text("Welcome to the Deal Card Application"
                " Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application"
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application"
                " Welcome to the Deal Card Application"
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application "
                "Welcome to the Deal Card Application    ",
              style: TextStyle(
                  color: Colors.grey,
                letterSpacing: 3


              ),
            ),
          ],
        ),
      ),
    );
  }
}
