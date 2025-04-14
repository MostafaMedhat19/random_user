import 'package:flutter/foundation.dart';

class RandomUserModelfeMAle {

  List<dynamic>female;

  RandomUserModelfeMAle({required this.female });
  factory RandomUserModelfeMAle.getJson(Map<String,dynamic> json)
  {

    return RandomUserModelfeMAle(female: json['results']  );
  }
}