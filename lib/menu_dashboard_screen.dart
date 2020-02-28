import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_app/bottom_bar_view/tabbar_manager.dart';
import 'package:navigation_app/drawer/STDrawer.dart';
import 'package:navigation_app/utils/stcolors.dart';
import 'package:navigation_app/utils/sttheme.dart';

class MenuDashboard extends StatefulWidget {
/*
  Widget menu(BuildContext context) {
    return Column(
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

*/

  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State {
  Color backgroundColor = Color(0xFF4A4A58);
  TabBarScreenManager tabBarScreenManager = new TabBarScreenManager();

  @override
  void initState() {
    tabBarScreenManager.initState(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        drawer: STDrawer(),
        appBar: AppBar(
          title: Text("Navigation"),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: Scaffold(
            body: _tabBarView(),
            bottomNavigationBar: _tabBarWidget(),
          ),
        ));
  }

  _tabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: tabBarScreenManager.screenDataModel.tabbarItems,
    );
  }

  Widget _tabBarWidget() {
    return Container(
      child: TabBar(
        tabs: bottomTabBarItems,
      ),
    );
  }

  List<Widget> get bottomTabBarItems {
    return [
      _tab("Home", "assets/icons/home/home.png"),
      _tab("Work Plan", "assets/icons/work/work.png"),
      _tab("Attendance", "assets/icons/attendance/attendance.png"),
      _tab("Orders", "assets/icons/setting/settings.png"),
      _tab("More", "assets/icons/setting/settings.png")
    ];
  }

  _tab(String tabTitle, String imagePath) {
    return Container(
      height: 73,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: STColors.appBlackLight
                )
            )
        ),
        child: Column(
         children: <Widget>[
            Container(
              child: Center(
                child: Tab(
                  child: Text(tabTitle, style: TextStyle(color: Colors.black,
                  fontSize: 10),),
                  icon: ImageIcon(
                    AssetImage(imagePath),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
