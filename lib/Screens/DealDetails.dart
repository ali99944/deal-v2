import 'package:flutter/material.dart';

class DealDetails extends StatefulWidget {
  final Map deal;
  const DealDetails({Key? key, required this.deal}) : super(key: key);

  @override
  State<DealDetails> createState() => _DealDetailsState();
}

class _DealDetailsState extends State<DealDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                child: TextButton(
                  child: Text('back'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            SizedBox(height: 20,),
            Container(
              child: Text('Deal Card',style: TextStyle(color: Colors.amber,fontSize: 40,fontFamily: 'serif'),),
              alignment: Alignment.center,
              width: double.infinity,
              height: 250,
            ),
            SizedBox(height: 20,),
            Align(
              child: Text('shop name: ${widget.deal['shopName']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,),

            SizedBox(height: 20,),
            Align(
              child: Text('discount: ${widget.deal['discount']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,),


            SizedBox(height: 20,),
            Align(
              child: Text('contact: ${widget.deal['contact']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,) ,


            SizedBox(height: 20,),
            Align(
              child: Text('workTime: ${widget.deal['workTime']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,) ,

            SizedBox(height: 20,),
            Align(
              child: Text('address: ${widget.deal['address']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,),

            SizedBox(height: 20,),
            Align(
              child: Text('expiry Date: ${widget.deal['expiryDate']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,),

            SizedBox(height: 20,),
            Align(
              child: Text('others: ${widget.deal['description']}',style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
            Divider(height: 2,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
