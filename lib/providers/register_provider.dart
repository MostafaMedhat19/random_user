import 'package:flutter/cupertino.dart';
import 'package:random_user/services/register_service.dart';

import '../models/rigistration_model.dart';

class RegisterProvider extends ChangeNotifier
{
  RegisterModel? model ;
  String ?message ;
  Future<void>loginUser (String email , String password )async
  {
     model = await RegisterService.login(email, password);
     message = model?.message;
     notifyListeners();
  }
  Future<void>signUp (String email , String password , String name , String phone)async
  {
    model = await RegisterService.signUp(email, password, name, phone);
    message = model?.message;
    notifyListeners();
  }
}