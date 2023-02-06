
import 'package:deal/Screens/DrawerScreen.dart';
import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl
        , child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Contact Us')),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Center(
                child: Text("D",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,

                      color: Colors.amber,
                      fontSize: 300,
                      decoration: TextDecoration.underline


                  ),
                ),

              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  maxLines: 15,
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Review...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15.0),

                    ),




                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 250,

                child: MaterialButton(onPressed: (){

                },
                  color: Colors.amber,

                  child: Text("Send",
                    style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic),

                  )

                  ,),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
}
