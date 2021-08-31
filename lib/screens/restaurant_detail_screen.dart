import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final resto = ModalRoute.of(context)!.settings.arguments as Restaurant;
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama restorant'),
      ),
      body: Container(
        child: Text(resto.name),
      ),
    );
  }
}
