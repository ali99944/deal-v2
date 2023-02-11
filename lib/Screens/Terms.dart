
import 'package:deal/Screens/DrawerScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('terms_message').tr()),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: DrawerScreen() ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("terms_message",
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline

              ),
            ).tr(),
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
