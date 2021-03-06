import 'dart:convert';

import 'package:restaurant_app/models/menus.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: double.parse(json['rating'].toString()),
      menus: Menus.fromJson(json['menus']),
    );
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) return [];

  final Map<String, dynamic> parsedMap = jsonDecode(json);
  List<dynamic> parsedList = parsedMap["restaurants"];
  return parsedList.map((json) {
    return Restaurant.fromJson(json);
  }).toList();
}
