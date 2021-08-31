import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';
import 'package:restaurant_app/screens/restaurant_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: RestaurantOverviewScreen(),
        routes: {
          RestaurantOverviewScreen.routeName: (context) =>
              RestaurantOverviewScreen(),
          RestaurantDetailScreen.routeName: (context) =>
              RestaurantDetailScreen(),
        });
  }
}
