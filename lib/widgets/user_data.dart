import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  UserData extends StatelessWidget {
    UserData({super.key, required this.name ,required this.email , required this.image});
 String name ;
 String image ;
 String email ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 20,
          ),
          const SizedBox(width: 10,) ,
          Text(name),
          const SizedBox(width: 10,) ,
          Text(email),
        ],
      ),
    );
  }
}
