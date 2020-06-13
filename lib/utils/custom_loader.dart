import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {

  final screenType;

  const CustomLoader(
       this.screenType);

  @override
  Widget build(BuildContext context) {
    return
     screenType == "login"? Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SpinKitCircle(color: Colors.black),
        )
      ):"";
  }
}
