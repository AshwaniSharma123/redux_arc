import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/action/login_action.dart';
import 'package:redux_strucuture/redux/appstate.dart';
import 'package:redux_strucuture/redux/model/login_model.dart';
import 'package:redux_strucuture/redux/model/response_api/login_response.dart';
import 'package:redux_strucuture/utils/config/config.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  //Live
  String baseUrl = "";
  String version = "v1";
  String loginApi = "/login";

  static final ApiProvider _apiProvider = ApiProvider._internal();

  ApiProvider._internal() {
    // initialization logic here
    baseUrl = 'http://myswimbuddy.mobilytedev.com/api/';
  }
  factory ApiProvider() {
    return _apiProvider;
  }



  //-------------------------------------------Sign In Api------------------------------------//
  Future<LoginResponse> signInApi(Store<AppState> store,
      LoginModel model, String language) async {
    Map<String, String> header = new Map();
    header["content-type"] = "application/x-www-form-urlencoded";

    store.dispatch(LoginLoaderAction(true));

    LoginResponse _loginResponse;

    try {
      final response = await http.post(baseUrl + version + loginApi,
          body: {
            "email": model.email,
            "password": model.password,
            "device_type": GetDeviceType.getDeviceType(),
            "device_token":model.deviceId??'',
            "language":language
          },
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        store.dispatch(LoginLoaderAction(false));
        print("response login: ${response.body}");

        _loginResponse = LoginResponse.fromJson(json.decode(response.body));


        return _loginResponse;
      } else if (response.statusCode == 403) {
        print("c");
        store.dispatch(LoginLoaderAction(false));
        return null;
      } else {
           print("jgfjbkbjgkjgnkgj");
        store.dispatch(LoginLoaderAction(false));
        FlutterToast.showToastCenter("Invalid email/password");
        return null;
      }
    } catch (e) {
      print(e +"fskjngjn ");
      store.dispatch(LoginLoaderAction(false));
      return null;
    }
  }

}
