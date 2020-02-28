
import 'package:flutter/material.dart';
import 'package:navigation_app/bottom_bar_view/tabbar_data_model.dart';
import 'package:navigation_app/menu_dashboard_screen.dart';

class TabBarScreenManager {
  TabbarDataModel screenDataModel = new TabbarDataModel();

  void initState(DashboardState dashboardState) {
//    screenDataModel.tabController = TabController(length: 5);

    _initializeTabWidgets();
  }

  void _initializeTabWidgets() {
    if (screenDataModel.tabbarItems == null) {
      screenDataModel.tabbarItems=[
        Navigator(

          onGenerateRoute: (route){
            return MaterialPageRoute(builder: (context){
                      // class name of the respective  route
            });
          },
        ),
        Navigator(

          onGenerateRoute: (route){
            return MaterialPageRoute(builder: (context){
              // class name of the respective  route
            });
          },
        ),
        Navigator(

          onGenerateRoute: (route){
            return MaterialPageRoute(builder: (context){
              // class name of the respective  route
            });
          },
        ),
        Navigator(

          onGenerateRoute: (route){
            return MaterialPageRoute(builder: (context){
              // class name of the respective  route
            });
          },
        ),
        Navigator(

          onGenerateRoute: (route){
            return MaterialPageRoute(builder: (context){
              // class name of the respective  route
            });
          },
        ),
      ];
    }
  }
}
