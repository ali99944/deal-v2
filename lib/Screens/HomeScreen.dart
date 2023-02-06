

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:deal/Screens/ServiceDeals.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DrawerScreen.dart';
import 'ShoesDetails.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    return  SafeArea(

      child: Scaffold(

    appBar: AppBar(
      title: Text(
        'Deal',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.amber,
          fontSize: 33


        ),
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    ),
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("carousels").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if(snapshot.hasData && !snapshot.hasError){
                    var carousels = snapshot.data!.docs;
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 400,
                          autoPlay: true,
                          initialPage: 0,
                          autoPlayInterval: Duration(seconds: 3)
                      ),
                      itemCount: carousels.length,
                      itemBuilder: (context,i,pi){
                        Map carousel = carousels[i].data();
                        return Container(
                          width:double.infinity,
                          height: 400,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.memory(base64Decode(carousel['encoding'])).image
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
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("services").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData && !snapshot.hasError){
                    List services = snapshot.data.docs;
                    return GridView.builder(
                      itemCount: services.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2
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
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 2),
                                borderRadius: BorderRadius.circular(12 ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.memory(base64Decode(service['image'])).image
                                )
                              ),
                              alignment: Alignment.topCenter,
                              child: Text(service['serviceName']),
                            ),
                          );
                        }
                    );
                  }else{
                    return CircularProgressIndicator();
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
