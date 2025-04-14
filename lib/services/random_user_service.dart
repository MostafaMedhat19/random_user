import 'package:dio/dio.dart';
import 'package:random_user/models/random_user_model.dart';

import '../models/random_userMale_model.dart';
import '../models/rondom_userFemale.dart';

class RandomUserService { 
  static Dio dio = Dio(); 
  static Future<RandomUserModel?>getUsers()async
  {
     Response response = await dio.get('https://randomuser.me/api/?results=50');
     if(response.statusCode== 200)
       {

          return RandomUserModel.getJson(response.data);
       }

     return null ;
  }

  static Future<RandomUserModelMale?>getMaleUsers()async
  {
    Response response = await dio.get('https://randomuser.me/api/?gender=male&results=50');
    if(response.statusCode== 200)
    {
      return RandomUserModelMale.getJson(response.data);
    }
    return null ;
  }
  static Future<RandomUserModelfeMAle?>getFemaleUsers()async
  {
    Response response = await dio.get('https://randomuser.me/api/?gender=female&results=50');
    if(response.statusCode== 200)
    {
      return RandomUserModelfeMAle.getJson(response.data);
    }
    return null ;
  }
}