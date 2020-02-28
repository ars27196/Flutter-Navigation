import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_app/utils/stcolors.dart';
import 'package:navigation_app/utils/sttheme.dart';

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State {
  @override
  Widget build(BuildContext context) {
    var thirtyPercent = (MediaQuery.of(context).size.height) * 0.3;
    var seventyPercent = MediaQuery.of(context).size.height * 0.663;
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: thirtyPercent,
              color: Colors.deepOrangeAccent,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.apps),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Adill Fayyaz",
                                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white)),
                            Text("20 March 2020",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.replay),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 65, left: 20, right: 20),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Today")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 20, right: 20),
              width: double.infinity,
              height: seventyPercent,
              color: Colors.blueGrey,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: -50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 350,
                          height: 200,
                          color: Colors.white,

                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 200, left: 20,right: 20),
                    child: Container(
                      child:GridView.count(crossAxisCount: 2
                      ,
                      children: <Widget>[
                        _card(),
                        _card(),
                        _card(),
                        _card()

                      ],) ,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  _card() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:20.0,left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(width: 80,child: Text("Revenue Genrated",maxLines:2)),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(Icons.access_alarm,size: 30,),
                )]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 12, right: 12),
                child: Text("Rs 12000", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),

    );
  }
}

_buttonParentClass() {
  Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(5),
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: _button2("All", true, 12),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: _button2("Expense", false, 2),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: _button2("Meetings", false, 2),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: _button2("Work From Home", false, 2),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]));
}

_button2(String title, bool isSelected, int numberOfRequests) {
  return Container(
      padding: EdgeInsets.all(2),
      height: 44,
      child: new CupertinoButton(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color:
                          isSelected ? STColors.white : STColors.appBlueMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: STTheme.appDefaultFont,
                    ),
                  ),
                  numberOfRequests > 0
                      ? SizedBox(
                          width: 5,
                        )
                      : Container(),
                  numberOfRequests > 0
                      ? Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: (isSelected)
                                ? STColors.white
                                : STColors.appDardkRedColor,
                          ),
                          child: Center(
                              child: Text(numberOfRequests.toString(),
                                  style: TextStyle(
                                      color: !(isSelected)
                                          ? STColors.white
                                          : STColors.appDardkRedColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: STTheme.appDefaultFont))),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
        color: STColors.clear,
        onPressed: () {
//                      controller.reverse();
        },
      ),
      decoration: isSelected
          ? BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [STTheme.shadowForWidgets()],
              gradient: LinearGradient(
                  colors: [STColors.appBlue, STColors.appblueGradientEnd],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.clamp),
            )
          : BoxDecoration(
              shape: BoxShape.rectangle,
              color: STColors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [STTheme.borderForWidgets()],
            ));
}
