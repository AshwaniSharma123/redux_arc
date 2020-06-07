import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux_strucuture/utils/color/appColor.dart';


class FlutterToast {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: AppColors.colorGreenAccent,
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }

  static void showToastCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: AppColors.colorLightBlue,
        textColor: Colors.white,
        fontSize: 15.0);
  }
}

class UtilsApp {
  static RegExp getRegexPassword() {
    Pattern pattern = r'^(?=.*?)(?=.*?)(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);

    return regex;
  }

  static bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return false;
    }
    else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}

class AWSConstants {
  static String getBucketName() {
    String bucketName = "myswimbuddy";
    return bucketName;
  }
}

class GetDeviceType {
  static String getDeviceType() {
    String _deviceType;
    if( Device.get().isAndroid ){
      _deviceType = "android";
    }else{
      _deviceType = "ios";
    }
    return _deviceType;
  }
}

class GetDeviceToken {
  getDeviceToken() async{
    String _deviceToken;
    final FirebaseMessaging _fcm = FirebaseMessaging();
    _deviceToken = await _fcm.getToken();
    return _deviceToken;
  }
}

class Constants {
  static int getRoute = 0;
  static int getContactPage = 0;
  static int showLoader = 1;
}
