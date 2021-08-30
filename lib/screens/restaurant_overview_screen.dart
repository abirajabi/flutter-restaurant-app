import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class RestaurantOverviewScreen extends StatelessWidget {
  static const routeName = '/restaurants';

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurant> restos = parseRestaurant(snapshot.data);
        return ListView.builder(
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
        child: Image.network(resto.pictureId),
      ),
      title: Text(resto.name),
      subtitle: Text(resto.description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Restaurant'),
                SizedBox(
                  height: 16,
                ),
                Text('Recommendation restaurant for you'),
                SizedBox(
                  height: 16,
                ),
                _buildList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
