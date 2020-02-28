import 'package:flutter/material.dart';

//import 'package:flutter_alert/flutter_alert.dart';

import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;
import 'dart:convert' show json;


class AppUtil {

  static bool isIOS() {
    return Platform.isIOS;
  }

  static MediaQueryData _mediaQueryData = null;

  static double _deviceHeight = 0,
      _deviceWidth = 0,
      _paddingTop = 0,
      _paddingBottom = 0;

  static double deviceHeight(BuildContext context) {
    try {
      MediaQueryData mediaQueryData = MediaQuery
          .of(context, nullOk: true);
      if (mediaQueryData != null) {
        _deviceHeight = mediaQueryData.size.height;
        _mediaQueryData = mediaQueryData;
      }
    } catch (e) {

    }
    return _deviceHeight;
  }

  static double deviceWidth(BuildContext context) {
    try {
      MediaQueryData mediaQueryData = MediaQuery
          .of(context, nullOk: true);
      if (mediaQueryData != null) {
        _deviceWidth = mediaQueryData.size.width;
        _mediaQueryData = mediaQueryData;
      }
    } catch (e) {

    }
    return _deviceWidth;
  }

  static double statusBarHeight(BuildContext context) {
    try {
      MediaQueryData mediaQueryData = MediaQuery
          .of(context, nullOk: true);
      if (mediaQueryData != null) {
        _paddingTop = mediaQueryData.padding.top;
        debugPrint(mediaQueryData.padding.top.toString());
        _mediaQueryData = mediaQueryData;
      }
    } catch (e) {

    }
    return _paddingTop;
  }

  static double bottomSafeArea(BuildContext context) {
    try {
      MediaQueryData mediaQueryData = MediaQuery
          .of(context, nullOk: true);
      if (mediaQueryData != null) {
        _paddingBottom = mediaQueryData.padding.bottom;
        _mediaQueryData = mediaQueryData;
      }
    } catch (Object) {

    }
    return _paddingBottom;
  }

  static double whiteBackgroundHeight(BuildContext context) {
    double whiteBackgroundHeight = AppUtil.deviceHeight(context) -
        (50 + extraMarginRequiredForInternalPages(context));
    return whiteBackgroundHeight;
  }

  static double whiteBackgroundWidth(BuildContext context) {
    double width = AppUtil.deviceWidth(context);
    double whiteWidth = width * 0.9;
    return whiteWidth;
  }

  static double extraMarginRequiredForInternalPages(BuildContext context) {
    double statusHeight = AppUtil.statusBarHeight(context);
    double extraMargin = 0;
    if (AppUtil.isIOS() && statusHeight > 30) {
      extraMargin = 50;
      print('extraMargin');
    }
    return extraMargin;
  }


  static bool showingLoader = false;
  static int loaderCount = 0;


  /// Dont call it if loader not showing
  static void dismissLoader({@required BuildContext context}) {
    loaderCount--;
    debugPrint("dismissLoader $loaderCount");
    if (loaderCount == 0 && context != null) {
      showingLoader = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void pop(
      {BuildContext context, bool fromRoot = false, var valueToReturn}) {
    if (Navigator.of(context, rootNavigator: fromRoot).canPop()) {
      Navigator.of(context, rootNavigator: fromRoot).pop(valueToReturn);
    }
  }


  static dynamic decodeString(String responseBody) {
    return json.decode(responseBody);
  }

  static String encodeString(dynamic toEncode) {
    return json.encode(toEncode);
  }




}
