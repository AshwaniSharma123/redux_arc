import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/appstate.dart';
import 'package:redux_strucuture/ui/loginScreen/login.dart';
import 'package:redux_strucuture/utils/color/appColor.dart';
import 'package:redux_strucuture/utils/language/language_application.dart';
import 'package:redux_strucuture/utils/language/localization_delegate.dart';
import 'package:redux_strucuture/utils/navigator/routes.dart';



class Application extends StatefulWidget {
  final Store<AppState> store;

  Application(this.store) : super();

  @override
  State<StatefulWidget> createState() {
    return _MyAppState(store);
  }
}

class _MyAppState extends State<Application> {
  DemoLocalizationsDelegate _newLocaleDelegate;

  final Store<AppState> store;

  _MyAppState(this.store) : super();

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = DemoLocalizationsDelegate(newLocale: null);
    languageApplication.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = DemoLocalizationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
//    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    SystemChrome.setPreferredOrientations([
      //orientation of app(currently portrait supported)
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      color: AppColors.colorWhite,
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en"),
        const Locale("zh"),
      ],

      darkTheme: ThemeData(
        brightness: Brightness.dark, //theme of app
        primaryColor: Colors.white,
      ),

      navigatorKey: Keys.navKey,
      //key navigator for app to be used globally throughout app
      debugShowCheckedModeBanner: false,
      //debug tag - as false
      home: LoginScreen(),
      //list all routes to be used in app
      routes: <String, WidgetBuilder>{
        Routes.loginScreen: (context) {
          //Sign In Page
          return LoginScreen();
        },
      },
    );
  }
}
