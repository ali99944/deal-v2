import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal/Screens/DealDetails.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../Provider/UserProvider.dart';
import '../Services/UserServices.dart';

class ServiceDeals extends StatefulWidget {
  final String category;
  const ServiceDeals({Key? key, required this.category}) : super(key: key);

  @override
  State<ServiceDeals> createState() => _ServiceDealsState();
}

class _ServiceDealsState extends State<ServiceDeals> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("cards").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData && !snapshot.hasError){
              List serviceDeals = snapshot.data!.docs.where((field) => field['serviceName'] == widget.category).toList();
              return serviceDeals.isEmpty ? Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                        child:Text('emptyDeals',style: TextStyle(fontSize: 30,color: Colors.amber,fontFamily: 'serif'),).tr()
                    ),
                    
                    Positioned(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,size: 40,color: Colors.amber,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      top: 10,
                      left: 10,
                    )
                  ],
                ),
                color: Colors.black,
              ) : ListView.builder(
                itemCount: serviceDeals.length,
                itemBuilder: (context,i){
                  Map deal = serviceDeals[i].data();
                  return InkWell(
                    onTap: ()async{
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DealDetails(deal:deal))
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: Image.memory(base64Decode(deal['shopImage'])).image,
                          fit:BoxFit.cover
                        )
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection("favorites").snapshots(),
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                                if(snapshot.hasData && !snapshot.hasError){
                                  List data = snapshot.data!.docs;
                                  bool isFavorite = data.any((element) => element.data()['favorites'].contains(serviceDeals[i].id));

                                  return IconButton(
                                    icon: Icon(Icons.star,size: 30,color: !isFavorite ? Colors.white : Colors.amber,),
                                    onPressed: () async {
                                      String uid = Provider.of<UserProvider>(context,listen:false).uid;
                                      if(!isFavorite){
                                        await UserServices.addToFavorites(uid,serviceDeals[i].id);
                                      }else{
                                        await UserServices.removeFromFavorites(uid,serviceDeals[i].id);
                                      };
                                    },
                                  );
                                }else{
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },

                            ),
                            top: 8,
                            right: 8,
                          ),
                          Positioned(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  gradient: new RadialGradient(
                                    radius: 2,
                                    focalRadius: 3,
                                    colors:[Colors.yellowAccent, Colors.orange]
                                  ),
                                  color: Colors.amber,
                                ),
                                child: Text('${"discount_message".tr()} ${deal['discount']}%'),
                              ),
                              bottom: 7,
                              left:7
                          ),
                          Positioned(
                              child: Text('${context.locale.languageCode == 'en' ? deal['shopName'] : deal['arShopName']}',style: TextStyle(color: Colors.white),),
                              bottom: 7,
                              right:7
                          ),
                        ],
                      ),
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
    );
  }
}
