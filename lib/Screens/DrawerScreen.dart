
import 'package:deal/Screens/ContactUs.dart';
import 'package:deal/Screens/HomeScreen.dart';
import 'package:deal/Screens/Language.dart';
import 'package:deal/Screens/LoginScreen.dart';
import 'package:deal/Screens/NotificationsScreen.dart';
import 'package:deal/Screens/Terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('D',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontStyle: FontStyle.italic
              ),

              ),
            SizedBox(height: 10,),
            Text("بطاقه ديل",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 33
              
            ),
            ),
            SizedBox(height: 20,),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you are a Guest",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
                Icon(Icons.account_circle)
              ],
            ),
            SizedBox(height: 40,),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }),);
              },
              title: Text('Home Page'),
              leading: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),

            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NotificationsScreen();
                }),);
              },
              title: Text('Notifications'),
              leading: Icon(
                Icons.notifications,

              ),

            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Contactus();
                }),);
              },
              title: Text('Contact Us'),
              leading: Icon(
                Icons.connect_without_contact_rounded,
              ),

            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Terms();
                }),);
              },
              title: Text('Terms And Conditions'),
              leading: Icon(
                Icons.contact_support,

              ),

            ),
            ListTile(
              onTap: (){

              },
              title: Text('Rate'),
              leading: Icon(
                Icons.rate_review,

              ),

            ),
            ListTile(
              onTap: (){},
              title: Text('Share'),
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),

            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Language();
                } ),);
              },
              title: Text('Change Language'),
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),

            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                } ),);
              },
              title: Text('Login'),
              leading: Icon(
                Icons.login,
                color: Colors.black,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
