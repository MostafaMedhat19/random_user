import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key , required this.controller , required this.title , required this.icon});
  TextEditingController controller ;
  String title;
  IconData icon ;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
          label: Text(title),
          suffixIcon: Icon(icon),

        ),

        validator: (value) {
          if(value == null || value.isEmpty)
          {
            return 'Not Should be not Null $title';
          }
          return null ;
        },
      ),
    );
  }
}
