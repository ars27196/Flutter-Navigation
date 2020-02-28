import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app/utils/stcolors.dart';

import '../app_util.dart';

class STTheme {

  static const double HeaderHeight = 60;
  static const double TabbarHeight = 54;//Its excluding bottom safe araa
  static const double bodyStyleLeftPadding = 10;
  static const double bodyStyleRightPadding = 10;
  static const double bodyStyleTopPadding = 10;
  static const double bodyStyleBottomPadding = 10;
  static const double bodyStyleBorderRadius = 8;

  ///region Widget Bodies
  static Widget headerWidget({BuildContext context, String title, Widget titleWidget, Widget leadingItem, Widget trailingItem, bool forHomeScreen = false}) {
    double topExtraMargin = AppUtil.isIOS() ? 0 : 0;

    return Container(
      height: HeaderHeight,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: AppUtil.isIOS() ?  topExtraMargin : topExtraMargin),),
          Stack(
            children: <Widget>[
              leadingItem ?? Container(),
              titleWidget ?? Container(
                padding: EdgeInsets.only(top: 0),
                child:Center(
                  child: Container(
                    child: Align(alignment: Alignment.center,
                      child: Text(title ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: STColors.headerTitleColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: STTheme.appDefaultFont
                        ),
                      ),
                    ),
                    width: AppUtil.deviceWidth(context) * 0.8,
                  ),
                ),
                constraints: BoxConstraints(minWidth: double.infinity, minHeight: 30, maxHeight: HeaderHeight),
              ),
              trailingItem ?? Container()
            ],
          ),

        ],

      ),
      color: STColors.appbar,
    );
  }

  static Widget appStyleBody({BuildContext context, Widget child, EdgeInsetsGeometry padding = const EdgeInsets.only(
      left: bodyStyleLeftPadding, right: bodyStyleRightPadding, bottom: bodyStyleRightPadding, top: bodyStyleBottomPadding
  ),
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(bodyStyleBorderRadius),)}
  ) {
    return Expanded(
      child: Container(
        color: STColors.backgroundColor,
        padding: padding,
        child: appStyleBodyShape(
            context: context,
            child: child,
          padding: EdgeInsets.all(0),
          borderRadius: borderRadius,
        )
      ),
    );
  }

  static Widget appStyleBodyShape({BuildContext context, Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.only(left: bodyStyleLeftPadding, right: bodyStyleRightPadding, bottom: bodyStyleRightPadding, top: bodyStyleBottomPadding),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(bodyStyleBorderRadius),),
    Color backgroundColor = STColors.backgroundColor}) {
    return Container(
        color: backgroundColor,
        padding: padding,
        child: Container(
          decoration: BoxDecoration(borderRadius:
          borderRadius ?? BorderRadius.all(Radius.circular(bodyStyleBorderRadius),),
            boxShadow: [
              shadowForWidgets(),
            ],
            color: Colors.white,
          ),
          child: child,
        )
    );
  }

  static BoxShadow shadowForWidgets() {
    return BoxShadow(
        color: STColors.shadowColor,
        offset: Offset(0, 0),
        spreadRadius: 0,
        blurRadius: 4,
    );
  }

  static BoxShadow borderForWidgets() {
    return BoxShadow(
      color: STColors.appBlack,
      offset: Offset(0, 0),
      spreadRadius: 1,
//      blurRadius: 4,
    );
  }

  static Widget backButton(BuildContext context, {GlobalKey backKey}) {
    return Container(
      key: backKey,
      child: CupertinoButton(
        child: Image(
          image: AssetImage('assets/icons/common/back.png'),
          alignment: Alignment.topCenter,
        ),
        padding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
        onPressed: () {
          Future.delayed(Duration(milliseconds: 40), () {
            AppUtil.pop(context: context,);
          });
        },
      ),
      height: HeaderHeight,
      width: HeaderHeight,
      padding: EdgeInsets.only(
          left: 0,
          top: 0,
          bottom: 0,
      ),
    );
  }

  static Widget menuButton(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, {GlobalKey sideMenuKey}) {
    return Container(
      key: sideMenuKey,
      child: CupertinoButton(child: Image(image: AssetImage('assets/icons/common/menu.png'),
        alignment: Alignment.topCenter,
      ),
        padding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
        onPressed: () {
          Future.delayed(Duration(milliseconds: 40), () {
            scaffoldKey.currentState.openDrawer();
          });
        },
      ),
      height: HeaderHeight,
      width: HeaderHeight,
      padding: EdgeInsets.only(left: 0, top: 0, bottom: 0),
    );
  }





  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(
        color: STColors.white,
        fontSize: 17,
        fontFamily: STTheme.appDefaultFont,
        fontWeight: FontWeight.w500,
      ),),
      backgroundColor: STColors.appblueLight,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  ///endregion

  ///Gradient button to show
  static Widget gradientButton({BuildContext context, String title, VoidCallback onPressed, EdgeInsets margins}) {
    return Container(
      margin: margins,
        width: double.infinity,
        padding: EdgeInsets.all(0),

        height: 54,
        child: new CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Text( title,
            style: TextStyle(color: STColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: STTheme.appDefaultFont,
            ),
          ),
          color: STColors.clear,
          onPressed: onPressed,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(colors: [
            STColors.appBlue,
            STColors.appblueGradientEnd,
          ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp
          ),
        )
    );
  }

  ///
  static get textFieldsInputLine {
      return UnderlineInputBorder(borderSide: BorderSide(color: STColors.appBlackLight, style: BorderStyle.solid));
    }
///

  //endregion

  static get appDefaultFont {
    return "Raleway";
  }


  static get bodyShapeCornerRadius {
    return 6.0;
  }

  static get circleAvatarBackgroundColor {
    return STColors.backgroundColor;
  }

  static get textFieldHintStyle {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: STTheme.appDefaultFont,
        fontSize: 16,
        color: STColors.appBlackMedium
    );
  }
}