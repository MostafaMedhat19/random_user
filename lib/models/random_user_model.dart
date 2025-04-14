import 'package:flutter/foundation.dart';

class RandomUserModel {
  List<dynamic>data ;
  List<dynamic>male;
  List<dynamic>female ;
  RandomUserModel({required this.data , required this.female , required this.male});
  factory RandomUserModel.getJson(Map<String,dynamic> json)
  {

    return RandomUserModel(data: json['results'] ,female: json['results'] ,male: json['results'] );
  }
}