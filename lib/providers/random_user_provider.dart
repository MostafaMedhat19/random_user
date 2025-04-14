import 'package:flutter/cupertino.dart';
import 'package:random_user/models/random_user_model.dart';
import 'package:random_user/services/random_user_service.dart';

import '../models/random_userMale_model.dart';
import '../models/rondom_userFemale.dart';

class RandomUserProvider extends ChangeNotifier
{
  RandomUserModel? randomUserModel ;
  RandomUserModelMale? randomUserModelMale  ;
  RandomUserModelfeMAle? randomUserModelFeMale ;

  Future<void>randomUser ( )async
  {

    randomUserModel = await RandomUserService.getUsers();

    notifyListeners();

  }
  Future<void> maleUser( )async
  {
    randomUserModelMale = await RandomUserService.getMaleUsers();

    notifyListeners();

  }
  Future<void> FemaleUser( )async
  {
    randomUserModelFeMale = await RandomUserService.getFemaleUsers();

    notifyListeners();

  }

}