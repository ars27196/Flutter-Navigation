import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'STDrawerManager.dart';

class STDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return STDrawerState();
  }
}

class STDrawerState extends State {
  STDrawerManager _manager;

  @override
  void initState() {
    _manager = STDrawerManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: _manager.drawerHeader(
                startColor: Colors.lightBlueAccent,
                endColor: Colors.deepPurpleAccent,
                context: context,
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(right: 10, top: 20, bottom: 10),
                        child: Image.asset('assets/icons/setting/settings.png',
                            color: Colors.white),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20, left: 10),
                      child: Row(children: <Widget>[
                        CircleAvatar(
                          child: Image.asset(
                              'assets/icons/user_profile_image_placeholder/profile_img_placeholder.png'),
                          radius: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(children: <Widget>[
                              Text("AyKhan Safarli",
                                  style: TextStyle(color: Colors.white)),
                              Text("077 201 15 01",
                                  style: TextStyle(color: Colors.white)),
                            ]))
                      ]))
                ])),
          ),
          ListView(
            padding: EdgeInsets.only(top: 10),
            shrinkWrap: true,
            children: _manager.listItems(context: context, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
