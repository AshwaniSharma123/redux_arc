import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/model/login_model.dart';

import '../login_action.dart';

final loginLoaderReducer = TypedReducer<bool, LoginLoaderAction>(_loginLoaderActionReducer); //loader for login
final loginModelLoginReducer = TypedReducer<LoginModel, LoginDataSendAction>(modelLoginActionReducer); //data sent at login
// final appContextReducer = TypedReducer<BuildContext, BuildAppContextAction>(appContextActionReducer); //app context








//All methods declared in reducer are defined here...part of reducer only!


//............................................Reducer..............................................

bool _loginLoaderActionReducer(bool state, LoginLoaderAction action) { //login loader action
  return action.loginLloader;
}
LoginModel modelLoginActionReducer(LoginModel state, LoginDataSendAction action) { //data send at login action
  return action.loginModel;
}
// BuildContext appContextActionReducer(BuildContext state , BuildAppContextAction action){
// return action.appContext;
// }

