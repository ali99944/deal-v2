
import 'package:deal/Screens/DrawerScreen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Notifications')),
            backgroundColor: Colors.black,
          ),
          drawer: Drawer(
            child: DrawerScreen(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.notifications,color: Colors.black,size: 30,),
                      SizedBox(width: 5,),
                      Text("3",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                   height: 50,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey
                      )

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('مرحبا بكم في تطبيق ديل',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
                        Text(DateTime.now().toString(),style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic)),
                      ],
                    )


                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.grey
                          )

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('مرحبا بكم في تطبيق ديل',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
                          Text(DateTime.now().toString(),style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic)),
                        ],
                      )


                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.grey
                          )

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('مرحبا بكم في تطبيق ديل',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
                          Text(DateTime.now().toString(),style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic)),
                        ],
                      )


                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
