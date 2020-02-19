import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuDashboard extends StatelessWidget {
  Color backgroundColor = Color(0xFF4A4A58);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: menu(context),
      body: Stack(
        children: <Widget>[
          dashboardHome(context),
        ],
      ),
    );
  }

  Widget menu(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Message", style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Utility Bills",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Funds Transfer",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Branches", style: TextStyle(color: Colors.white, fontSize: 22))
        ],

    );
  }

  Widget dashboardHome(BuildContext context) {
    return Material(
        elevation: 8,
        color: backgroundColor,
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 38),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, color: Colors.white),
                  Text("My Cards",
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  Icon(Icons.settings, color: Colors.white)
                ],
              )
            ],
          ),
        ));
  }
}
