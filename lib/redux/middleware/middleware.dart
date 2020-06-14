//This class provides way to interact with actions that have been dispatched to the store before they reach the store's reducer
//here actions for API are dispatched(async requests)

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/action/login_action.dart';
import 'package:redux_strucuture/redux/model/response_api/login_response.dart';
import 'package:redux_strucuture/utils/config/config.dart';
import 'package:redux_strucuture/utils/database/pref_singleton.dart';
import 'package:redux_strucuture/utils/language/demo_localization.dart';
import 'package:redux_strucuture/utils/navigator/routes.dart';
import 'package:redux_strucuture/utils/services/api_provider.dart';
import 'package:redux_strucuture/utils/services/network.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../appstate.dart';

List<Middleware<AppState>> createAppMiddleware() {
  return <Middleware<AppState>>[
    thunkMiddleware,
    TypedMiddleware<AppState, LoginDataSendAction>(_logInAction), //login in user api //login in user api
  ];

  //..........................................Middleware methods.................................
}

//Login API >>>>>>>>>
void _logInAction(Store<AppState> store, LoginDataSendAction action,
    NextDispatcher next) async {
      print('jnigidjiohhhhhhhhhhhh');
  Connectivity connectivity = Connectivity();
  var connectivityResult = await connectivity.checkConnectivity();
  var conn = CheckConnection.getConnectionValue(connectivityResult);

  SharedPreferences _prefs = PrefsSingleton.prefs;
  if(conn == "Mobile" || conn == "Wi-Fi"){
    LoginResponse getResponse =
    await ApiProvider().signInApi(store, action.loginModel);

    if(getResponse != null){
      if(getResponse.success == false){
        FlutterToast.showToastCenter(getResponse.message);
      }else
      if(getResponse.statusCode == 200){
        if(getResponse.data.loginUser == 'client'){
           FlutterToast.showToastCenter("Logged in successfully...");
          await _prefs.setString(PreferenceNames.otp, "1");
          await _prefs.setString(PreferenceNames.token, getResponse.data.apiToken);
          await _prefs.setString(PreferenceNames.userId, getResponse.data.userId.toString());
          await _prefs.setString(PreferenceNames.notifications, getResponse.data.notifications.toString());
          // await _prefs.setString(PreferenceNames.language, getResponse.data.language.toString());
          await _prefs.setString(PreferenceNames.swimmerCount, "true");

          Keys.navKey.currentState.pushNamedAndRemoveUntil(
              Routes.successful, (Route<dynamic> route) => false);
          if(getResponse.data.swimmerCount == 0){
            //navigate to add swimmer class
            print("navigate swimmer class");
            await _prefs.setString(PreferenceNames.token, getResponse.data.apiToken);
            await _prefs.setString(PreferenceNames.userId, getResponse.data.userId.toString());
            // await _prefs.setString(PreferenceNames.language, getResponse.data.language.toString());
            await _prefs.setString(PreferenceNames.notifications, getResponse.data.notifications.toString());
            await _prefs.setString(PreferenceNames.swimmerCount, null);

            if(getResponse.data.otpVerified == "0"){                  
              FlutterToast.showToastCenter("Verify OTP first....");
              await _prefs.setString(PreferenceNames.otp, "0");
              Keys.navKey.currentState.pushNamedAndRemoveUntil(
                  Routes.successful, (Route<dynamic> route) => false);
            }else {
              await _prefs.setString(PreferenceNames.otp, "1");
           FlutterToast.showToastCenter("Add swimmers....");
              Keys.navKey.currentState.pushNamedAndRemoveUntil(
                  Routes.successful, (Route<dynamic> route) => false);
            }
          }
          else{
            FlutterToast.showToastCenter("Logged in successfully...");
            await _prefs.setString(PreferenceNames.otp, "1");
            await _prefs.setString(PreferenceNames.token, getResponse.data.apiToken);
            await _prefs.setString(PreferenceNames.userId, getResponse.data.userId.toString());
            await _prefs.setString(PreferenceNames.notifications, getResponse.data.notifications.toString());
            // await _prefs.setString(PreferenceNames.language, getResponse.data.language.toString());
            await _prefs.setString(PreferenceNames.swimmerCount, "true");

            Keys.navKey.currentState.pushNamedAndRemoveUntil(
                Routes.successful, (Route<dynamic> route) => false);
          }
        }
        else{
          // guardian
          FlutterToast.showToastCenter("Logged in successfully...");
          await _prefs.setString(PreferenceNames.otp, "1");
          await _prefs.setString(PreferenceNames.token, getResponse.data.apiToken);
          await _prefs.setString(PreferenceNames.userId, getResponse.data.userId.toString());
          await _prefs.setString(PreferenceNames.notifications, getResponse.data.notifications.toString());
          // await _prefs.setString(PreferenceNames.language, getResponse.data.language.toString());
          await _prefs.setString(PreferenceNames.swimmerCount, "true");

          Keys.navKey.currentState.pushNamedAndRemoveUntil(
              Routes.successful, (Route<dynamic> route) => false);
        }
      }else{
        if(getResponse.message != null){
          FlutterToast.showToastCenter(getResponse.message);
        }
        else{

        }
      }
    }
  }else{
    //no internet
    _noInternet(store);
  }
}
void _noInternet(Store store){
  SharedPreferences _prefs = PrefsSingleton.prefs;
  String _language = _prefs.getString(PreferenceNames.language);

  if(store.state.appContext != null){
    try{
      FlutterToast.showToastCenter(DemoLocalizations.of(store.state.appContext).trans('no_internet'));
    }catch(Ex){
      if(_language == 'english'){
        FlutterToast.showToastCenter("No Internet Connection!!");
      }else{
        FlutterToast.showToastCenter("No Internet Connection!!");
      }
    }
  }else {
    if(_language == 'english'){
      FlutterToast.showToastCenter("No Internet Connection!!");
    }else{
      FlutterToast.showToastCenter("No Internet Connection!!");
    }
  }
}

