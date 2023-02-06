
import 'package:deal/Provider/AdminMode.dart';
import 'package:deal/Screens/HomeScreen.dart';
import 'package:deal/Screens/RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdminHome.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var FormKey = GlobalKey<FormState>();
  bool isAdmin = false;
  String ?email;
  String? Password;
  final adminPassword = '123456';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: FormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('welcome in deal',

                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            color: Colors.amber
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.amber
                            )
                        ),
                        border: OutlineInputBorder(

                        ),
                        hintText: 'Email',


                      ) ,
                      onChanged: (data){
                        email = data;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your Email';
                        }
                      },

                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber
                          )
                        ),
                          border: OutlineInputBorder(

                          ),
                          hintText: 'password',


                      ) ,
                      onChanged: (data){
                        Password = data;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Password';
                        }
                      },
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: double.infinity,

                      child: MaterialButton(onPressed: ()async{
                        if(FormKey.currentState!.validate()){

                          try{
                            var auth = FirebaseAuth.instance;
                            UserCredential user =  await auth.signInWithEmailAndPassword(email: email!, password: Password!);
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return HomeScreen();
                            } ), );
                          } on FirebaseAuthException catch (ex){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar
                              (content: Text('${ex.message.toString()}'),
                              backgroundColor: Colors.red
                              ,),);
                          }

                        }
                      },
                        color: Colors.amber,

                        child: Text("Login",
                          style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic),

                        )

                        ,),
                    ),
                    SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('IF you don`t have account '),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return RegisterScreen();
                            } ),);
                          }, child: Text('Sign Up') )
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return HomeScreen();
                      }),);
                    }, child: Text('Skip',style: TextStyle(color: Colors.black,fontSize: 22),))
                  ],
                ),
              ),
            ),
          ),
    );

  }
}
