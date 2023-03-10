

import 'package:flutter/material.dart';

import 'dog_model.dart';

class ShoesDetils extends StatefulWidget {
  late final Row dog;



  @override
  late ShoesDetils State; createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<ShoesDetils> {
  // Arbitrary size choice for styles
  final double dogAvatarSize = 150.0;

  Widget get dogImage {
    // Containers define the size of its children.
    return Container(
      height: dogAvatarSize,
      width: dogAvatarSize,
      // Use Box Decoration to make the image a circle
      // and add an arbitrary shadow for styling.
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Like in CSS you often want to add multiple
        // BoxShadows for the right look so the
        // boxShadow property takes a list of BoxShadows.
        boxShadow: [
          const BoxShadow(
            // just like CSS:
            // it takes the same 4 properties
              offset: const Offset(1.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: -1.0,
              color: const Color(0x33000000)),
          const BoxShadow(
              offset: const Offset(2.0, 1.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              color: const Color(0x24000000)),
          const BoxShadow(
              offset: const Offset(3.0, 1.0),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              color: const Color(0x1F000000)),
        ],
        // This is how you add an image to a Container's background.
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/shoes.jpg'),
        ),
      ),
    );
  }

  // The rating section that says ★ 10/10.
  Widget get rating {
    // Use a row to lay out widgets horizontally.
    return Row(
      // Center the widgets on the main-axis
      // which is the horizontal axis in a row.
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(' 10 / 10',
            ),
      ],
    );
  }

  // The widget that displays the image, rating and dog info.
  Widget get dogProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        // This would be a great opportunity to create a custom LinearGradient widget
        // that could be shared throughout the app but I'll leave that to you.
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [

          ],
        ),
      ),
      // The Dog Profile information.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            ' Shoes  🎾',
            style: TextStyle(fontSize: 32.0),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text('desc')
          ),
          rating
        ],
      ),
    );
  }

  //Finally, the build method:
  //
  // Aside:
  // It's often much easier to build UI if you break up your widgets the way I
  // have in this file rather than trying to have one massive build method
  @override
  Widget build(BuildContext context) {
    // This is a new page, so you need a new Scaffold!
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet'),
      ),
      body: dogProfile,
    );
  }
}