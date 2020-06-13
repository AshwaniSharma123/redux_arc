import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/action/login_action.dart';
import 'package:redux_strucuture/redux/appstate.dart';
import 'package:redux_strucuture/redux/model/login_model.dart';
import 'package:redux_strucuture/utils/color/appColor.dart';
import 'package:redux_strucuture/utils/custom_loader.dart';
import 'package:redux_strucuture/utils/language/demo_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Store<AppState> store;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
   final FirebaseMessaging _fcm = FirebaseMessaging();
  String _deviceToken = '56756';

  getDeviceToken() async {
    _deviceToken = await _fcm.getToken();
    print(_deviceToken);
    return _deviceToken;
  }

  @override
  void initState() {
    //  getDeviceToken();
     // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return StoreConnector<AppState, _LoginModel>(
        converter: (Store<AppState> store) {
          this.store = store;
          return _LoginModel.create(store, context);
        },
        onInit: (store) {},
        onDidChange: (store) {},
        builder: (BuildContext context, _LoginModel reduxSetup) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: AppColors.colorWhite,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: reduxSetup.isLoader
                  ? CustomLoader('login')
                  : SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: AppColors.colorBlue,
                        child: Stack(
                          children: <Widget>[
                            card(reduxSetup)
                          ],
                        ),
                      ),
                    ),
            ),
          );
        });
  }

  /*Login card*/
  Widget card(_LoginModel reduxSetup) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(280),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(40),
                  0, ScreenUtil.getInstance().setWidth(40), 0),
              height: ScreenUtil.getInstance().setHeight(900),
              // width: MediaQuery.of(context).size.width * 0.88,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2.0,
                color: AppColors.colorWhite,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        emailField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        passwordField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        signInButton(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Please enter email',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return DemoLocalizations.of(context).trans('login_email');
        } else if (!EmailValidator.validate(value, true)) {
          return DemoLocalizations.of(context).trans('login_not_email');
        } else {
          return null;
        }
      },
      controller: _emailController,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'password',
      ),
     validator: (value) {
                if (value.isEmpty) {
                  return DemoLocalizations.of(context)
                      .trans('login_enter_pass');
                } else if (value.length < 5) {
                  return DemoLocalizations.of(context)
                      .trans('login_enter_atlst_pass');
                } else if (value.length > 20) {
                  return DemoLocalizations.of(context)
                      .trans('login_pass_not_great');
                } else
                  return null;
              },
      controller: _passwordController,
    );
  }

  Widget signInButton() {
    return MaterialButton(
        child: Text(
          'Sign in',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (_formKey.currentState.validate()) {
            print('nvkjnxkcjxfnbcnmbmbncm');
//            store.dispatch(BuildAppContextAction(context));
            store.dispatch(LoginDataSendAction(
              LoginModel(_emailController.text, _passwordController.text, _deviceToken,
                  "android"),
            ));
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
        });
  }
}

class _LoginModel {
  final bool isLoader;
  final Store<AppState> store;
  final LoginModel loginModel;

  _LoginModel(this.isLoader, this.store, this.loginModel);

  factory _LoginModel.create(Store<AppState> store, BuildContext context) {
    return _LoginModel(store.state.loginLoader, store, store.state.loginModel);
  }
}
