import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_strucuture/redux/appstate.dart';
import 'package:redux_strucuture/utils/color/appColor.dart';
import 'package:redux_strucuture/utils/language/demo_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DialogGender extends StatefulWidget {
  final  Store<AppState> store;
  final  String gender;

  DialogGender(
      this.store,
      this.gender,
      );



  @override
  _MyDialogContentState createState() => new _MyDialogContentState(this.store,this.gender);
}

class _MyDialogContentState extends State<DialogGender> {
  Store<AppState> store;
  String _gender;

  _MyDialogContentState(this.store,this._gender);

  int _radioValue1 = -1;


  @override
  void initState(){
    super.initState();
    if(_gender.toLowerCase() == 'male'){
      _radioValue1 = 0;
    }else if(_gender.toLowerCase() == 'female'){
      _radioValue1 = 1;
    }
  }



  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
      backgroundColor: Colors.white,
      title: Text(DemoLocalizations
          .of(context)
          .trans('dialog_gender'),style: new TextStyle(color: AppColors.colorBlack,
          fontFamily: 'popBlackSemiBold' ,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(48))),
      content:
      SingleChildScrollView(
        child:
        Container(
            height: 100.0, // Change as per your requirement
            width: MediaQuery.of(context).size.width,
            child:
            Scrollbar(
                child:
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          DemoLocalizations.of(context)
                              .trans('dialog_male'),
                          style: new TextStyle(fontSize: ScreenUtil(allowFontScaling: true).setSp(44)),
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          DemoLocalizations.of(context)
                              .trans('dialog_female'),
                          style: new TextStyle(fontSize: ScreenUtil(allowFontScaling: true).setSp(44)),
                        )
                      ],
                    ),

                  ],
                )
            )
        ),
      ),

      actions: <Widget>[
        FlatButton(
          child: Text(DemoLocalizations.of(context)
              .trans('dialog_cancel').toUpperCase(),style: new TextStyle(color: AppColors.colorBlue,
              fontFamily: 'popBlackSemiBold' ,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(44))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(DemoLocalizations.of(context)
              .trans('dialog_ok').toUpperCase(),style: new TextStyle(color: AppColors.colorBlue,
              fontFamily: 'popBlackSemiBold' ,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(44))),
          onPressed: () {
            Navigator.of(context).pop();

          },
        ),
      ],

    );
  }


  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
          _gender = "Male";
          break;
        case 1:
          _gender = "Female";
          break;
      }
    });
  }

}