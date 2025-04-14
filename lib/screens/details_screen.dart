import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.name ,required this.email , required this.image, required this.address});
  String name ;
  String image ;
  String email ;
  String address ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 50,
                ),
                const SizedBox(width: 10,) ,
                Text(name),
                const SizedBox(width: 10,) ,
                Text(email),
                const SizedBox(width: 10,) ,
                Text(address),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
