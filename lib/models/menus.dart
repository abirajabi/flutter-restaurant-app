import 'drinks.dart';
import 'foods.dart';

class Menus {
  List<Foods> foods = [];
  List<Drinks> drinks = [];

  Menus(this.foods, this.drinks);

  Menus.fromJson(Map<String, dynamic> json) {
    var fList = json["foods"] as List;
    var dList = json["drinks"] as List;

    List<Foods> foodList = fList.map((i) => Foods.fromJson(i)).toList();
    List<Drinks> drinkList = dList.map((i) => Drinks.fromJson(i)).toList();

    foods = foodList;
    drinks = drinkList;
  }
}
