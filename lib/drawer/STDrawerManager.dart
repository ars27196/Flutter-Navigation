import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class STDrawerManager {
  Widget drawerHeader(
      {BuildContext context, Widget child, Color startColor, Color endColor}) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated),
        border: Border(
          bottom: Divider.createBorderSide(context),
        ),
      ),
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: 20),
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
        child: child == null
            ? null
            : DefaultTextStyle(
                style: theme.textTheme.body2,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: child,
                ),
              ),
      ),
    );
  }

  listItems({BuildContext context, @required Color color}) {
    return <Widget>[
      _rowItem(
          title: "Home",
          imagePath: 'assets/icons/home/home.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
      _rowItem(
          title: "Work Plan",
          imagePath: 'assets/icons/work/work.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
      _rowItem(
          title: "Attendance",
          imagePath: 'assets/icons/attendance/attendance.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
      _rowItem(
          title: "Manual Visit",
          imagePath: 'assets/icons/visit/visit.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
      _rowItem(
          title: "History",
          imagePath: 'assets/icons/history/history.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
      _rowItem(
          title: "About",
          imagePath: 'assets/icons/about/about.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
      _rowItem(
          title: "Log Out",
          imagePath: 'assets/icons/log_out/log_out.png',
          color: color,
          callback: () {
            //      onclick response here
          }),
    ];
  }

  _rowItem(
      {@required String title,
      @required String imagePath,
      VoidCallback callback,
      @required Color color}) {
    return Column(
      children: <Widget>[
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 0),
                  child: Image.asset(
                    imagePath,
                    color: color,
                  ),
                ),

              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20 ),
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
//                      fontFamily: STTheme.appDefaultFont,
                          color: Colors.grey[400])),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),

          onTap: callback,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          child: Container(
            height: 0.4,
            color: color,
          ),
        )
      ],
    );
  }
}
