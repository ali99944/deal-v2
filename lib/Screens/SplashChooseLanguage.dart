import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class SplashChooseLanguage extends StatefulWidget {
  const SplashChooseLanguage({Key? key}) : super(key: key);

  @override
  State<SplashChooseLanguage> createState() => _SplashChooseLanguageState();
}

class _SplashChooseLanguageState extends State<SplashChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: context.locale.languageCode == 'en' ? 'ACCORD' : 'GESSTWO'
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("choose_language").tr()),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Row(
              children: [
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    width: 120,
                    child: MaterialButton(
                      onPressed: ()async{
                        await context.setLocale(Locale('en',''));
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context){
                            return LoginScreen();
                          })
                        );
                      },
                      color: Colors.amber,
                      child: Text('English'),
                    ),


                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    width: 120,
                    child: MaterialButton(
                      onPressed: ()async{
                        await context.setLocale(Locale('ar',''));
                        await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context){
                              return LoginScreen();
                            })
                        );
                      },
                      color: Colors.amber,
                      child: Text('اللفه العربيه '),
                    ),

                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
          )
      ),
    );
  }
}
