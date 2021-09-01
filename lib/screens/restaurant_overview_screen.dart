import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';

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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RestaurantDetailScreen.routeName,
          arguments: resto,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag: resto.pictureId,
                child: Image.network(
                  resto.pictureId,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resto.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(resto.city),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        resto.rating.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              elevation: 0,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/sliver-back.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black54,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.0, bottom: 8.0),
                        child: Text(
                          'Restaurants',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text(
                          'Recommended restaurant list just for you!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ];
        },
        body: _buildList(context),
      ),
    );
  }
}
