import 'package:flutter/material.dart';
import 'package:redux_strucuture/redux/model/login_model.dart';

class LoginLoaderAction {
  bool loginLloader;
  LoginLoaderAction(this.loginLloader);
}
class LoginDataSendAction {
  LoginModel loginModel;

  LoginDataSendAction(this.loginModel);
}
//to hit api
// class BuildAppContextAction {
//   BuildContext appContext;

//   BuildAppContextAction(this.appContext);
// }