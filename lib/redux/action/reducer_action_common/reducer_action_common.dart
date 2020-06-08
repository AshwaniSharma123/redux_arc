import 'package:redux/redux.dart';

import '../login_action.dart';

final loginLoaderReducer = TypedReducer<bool, LoginLoaderAction>(_loginLoaderActionReducer); //loader for login










//All methods declared in reducer are defined here...part of reducer only!


//............................................Reducer..............................................

bool _loginLoaderActionReducer(bool state, LoginLoaderAction action) { //login loader action
  return action.loginLloader;
}