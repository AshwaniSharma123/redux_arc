import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/appstate.dart';
import 'package:redux_strucuture/redux/reducer/app_reducer.dart';
import 'package:redux_strucuture/utils/color/appColor.dart';
import 'package:redux_strucuture/utils/database/pref_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'application.dart';


void main() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: AppColors.colorBlue, // status bar color
    statusBarIconBrightness: Brightness.light,
    // statusBarBrightness: Brightness.dark
  ));

    WidgetsFlutterBinding.ensureInitialized();
    PrefsSingleton.prefs = await SharedPreferences.getInstance();

  //add redux store provider function at app init
  final store = Store<AppState>(appReducer,
      initialState: AppState(loginLoader : false), //initialize value if you want!!
      // middleware: createAppMiddleware(),  //custom middleware function initialized
  );

  runApp(StoreProvider(
      store: store, child: Application(store))
  ); //run main function
}

// "message": "The token has been blacklisted" This message appears when same credentials logged in to any other device.