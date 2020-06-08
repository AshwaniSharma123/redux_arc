import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux_strucuture/utils/color/appColor.dart';

class AlertDialogBox extends StatefulWidget {
  @override
  _AlertDialogBoxState createState() => _AlertDialogBoxState();
}

//DemoLocalizations.of(context)
//          .trans('add_swim_swim_program')

class _AlertDialogBoxState extends State<AlertDialogBox> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        // title:
        content: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: texts(),
          ),
        ));
  }

  Widget button() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(70),
      width: MediaQuery.of(context).size.width * 0.70,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
            side: BorderSide(color: AppColors.colorAmber)),
        onPressed: () async {},
        color: AppColors.colorAmber,
        textColor: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              //alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Add My Slot to Cancelation-trade List",
                    style: TextStyle(
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(22.8),
                      fontFamily: 'popBlackLight',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget texts() {
    return Column(
      children: <Widget>[
        Text(
          'Are you sure you want to cancel',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(30),
              fontFamily: 'popBlackMedium'),
        ),
        Text(
          'this booking?',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(30),
              fontFamily: 'popBlackMedium'),
        ),
        Text(
          'Charges will apply. Click for details link about',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(21.5),
              fontFamily: 'popBlackRegular'),
        ),
        Text(
          'Cancelation policy, link read details about',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(21.5),
              fontFamily: 'popBlackRegular'),
        ),
        Text(
          'Cancelation Policy',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.colorBlue,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(24),
              fontFamily: 'popBlackRegular'),
        ),
        Text(
          'Policy vary between services. Also please',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(21.5),
              fontFamily: 'popBlackRegular'),
        ),
        Text(
          'remember that you can send someone in your',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(20.5),
              fontFamily: 'popBlackRegular'),
        ),
        Text(
          'place at no additional cost if you can not',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(21.5),
              fontFamily: 'popBlackRegular'),
        ),
        Text(
          'attend your lesson',
          style: TextStyle(
              color: AppColors.colorBlackText,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(21.5),
              fontFamily: 'popBlackRegular'),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setHeight(0),
            ScreenUtil.getInstance().setHeight(20),
            ScreenUtil.getInstance().setWidth(0),
            ScreenUtil.getInstance().setHeight(0),
          ),
          height: 0.5,
          color: AppColors.colorGray,
        ),
        button(),
      ],
    );
  }
}
