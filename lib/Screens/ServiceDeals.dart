import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal/Screens/DealDetails.dart';
import 'package:flutter/material.dart';

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
              return serviceDeals.isEmpty ? const Center(
                child:Text('no deals yet',style: TextStyle(fontSize: 30,color: Colors.amber,fontFamily: 'serif'),)
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
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: IconButton(
                              icon: Icon(Icons.star,size: 30,color: Colors.white,),
                              onPressed: (){},
                            ),
                            top: 8,
                            right: 8,
                          ),
                          Positioned(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                color: Colors.amber,
                                child: Text('Discount ${deal['discount']}%'),
                              ),
                              bottom: 7,
                              left:7
                          ),
                          Positioned(
                              child: Text('${deal['shopName']}',style: TextStyle(color: Colors.white),),
                              bottom: 7,
                              right:7
                          ),
                          Align(
                            child: Text('Deal Card',style: TextStyle(fontSize: 25,color: Colors.amber,fontFamily: 'serif'),),
                            alignment: Alignment.center,
                          )
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
