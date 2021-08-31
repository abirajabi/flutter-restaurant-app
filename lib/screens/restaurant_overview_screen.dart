import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class RestaurantOverviewScreen extends StatelessWidget {
  static const routeName = '/restaurants';

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurant> restos =
            parseRestaurant(snapshot.hasData ? snapshot.data : "");
        return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: restos.length,
          itemBuilder: (context, index) {
            return _buildRestoItem(context, restos[index]);
          },
        );
      },
    );
  }

  Widget _buildRestoItem(BuildContext context, Restaurant resto) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          resto.pictureId,
          width: 70,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(resto.name),
      subtitle: Text(
        resto.description,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(context),
    );
  }
}
