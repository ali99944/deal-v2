

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:deal/Screens/ServiceDeals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DrawerScreen.dart';
import 'ShoesDetails.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            height: double.infinity,
            color: Colors.black,
            child: Stack(
              children: [
                Align(
                  child: IconButton(
                    onPressed: (){
                      _scaffoldKey.currentState!.openDrawer();
                    }, icon: Icon(Icons.menu,color: Colors.white,size: 35,),
                  ),
                  alignment: context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight,
                ),
                Align(
                  child: Image.asset('images/deal.png'),
                  alignment: Alignment.topCenter,
                ),
                Align(
                  child: Text('Deal Card',style: TextStyle(color: Colors.white),),
                  alignment: Alignment.bottomCenter,
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("carousels").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if(snapshot.hasData && !snapshot.hasError){
                  var carousels = snapshot.data!.docs;
                  return carousels.isEmpty ? Center(
                    child: SizedBox(
                      height: 200,
                      child: Text('no carousels'),
                    ),
                  ): CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        initialPage: 0,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 3),
                      padEnds: false
                    ),
                    itemCount: carousels.length,
                    itemBuilder: (context,i,pi){
                      Map carousel = carousels[i].data();
                      return Container(
                        width:double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.memory(base64Decode(carousel['encoding'])).image,
                              fit: BoxFit.cover
                            )
                        ),
                      );
                    },
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("services").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData && !snapshot.hasError){
                    List services = snapshot.data.docs;
                    return Container(
                      decoration: BoxDecoration(
                        border:Border.all(color: Colors.grey,width: 2)
                      ),
                      child: GridView.builder(
                        itemCount: services.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            mainAxisSpacing: 1,
                          ),
                          itemBuilder: (context,i){
                            Map service = services[i].data();
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return ServiceDeals(category:service['serviceName']);
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.memory(base64Decode(service['image'])).image
                                  )
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      child: Text(service['serviceName'] ?? '',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                                      alignment: Alignment.topCenter,
                                    ),
                                    Align(
                                      child: Text('${service['arServiceName'] ?? ''}',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    );
                  }else{
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
