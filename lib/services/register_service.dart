import 'package:dio/dio.dart';
import 'package:random_user/models/rigistration_model.dart';

class RegisterService {

  static Dio dio = Dio();
  static Future<RegisterModel?>login (String email , String password )async
  {
    Response response  = await dio.post('https://elsewedyteam.runasp.net/api/Login/CheckUser',
        data :{ 'Email': email , 'Password': password});
    if(response.statusCode == 200) {
      return RegisterModel.getStatus(response.data);
    }

    return null ;
  }
  static Future<RegisterModel?>signUp (String email , String password , String name , String phone)async
  {
    Response response  = await dio.post('https://elsewedyteam.runasp.net/api/Register/AddUser',
        data :{ 'Email': email , 'Password': password , 'Name': name ,'Phone': phone});
    if(response.statusCode == 200) {
      return RegisterModel.getStatus(response.data);
    }
    return null ;
  }

}
