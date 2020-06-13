import 'package:flutter/widgets.dart';
import 'package:redux_strucuture/redux/model/login_model.dart';

@immutable
class AppState {

final bool loginLoader;
final LoginModel loginModel;  //login data send at api while at server - login
final BuildContext appContext; //package for add swimmer

const AppState({
  this.loginLoader,
  this.loginModel,
  this.appContext,
});
}