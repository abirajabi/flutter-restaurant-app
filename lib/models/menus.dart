import 'drinks.dart';
import 'foods.dart';

class Menus {
  List<Foods> foods = [];
  List<Drinks> drinks = [];

  Menus(this.foods, this.drinks);

  Menus.fromJson(Map<String, dynamic> json) {
    foods = Foods.fromJson(json["foods"]) as List<Foods>;
    drinks = Foods.fromJson(json["drinks"]) as List<Drinks>;
  }
}
