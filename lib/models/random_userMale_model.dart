import 'package:flutter/foundation.dart';

class RandomUserModelMale {

  List<dynamic>male;

  RandomUserModelMale({required this.male });
  factory RandomUserModelMale.getJson(Map<String,dynamic> json)
  {

    return RandomUserModelMale(male: json['results']  );
  }
}