import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final resto = ModalRoute.of(context)!.settings.arguments as Restaurant;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              title: Text(resto.name),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: Stack(
                        children: [
                          Hero(
                            tag: resto.pictureId,
                            child: Image.network(
                              resto.pictureId,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              resto.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(resto.city),
                            ],
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(resto.description),
                          SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            'Foods',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: resto.menus.foods.map((food) {
                  return GridTile(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/placeholder.png',
                        ),
                      ],
                    ),
                    footer: GridTileBar(
                      title: Text(
                        food.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Drinks',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  );
                }, childCount: 1),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: resto.menus.drinks.map((drink) {
                  return GridTile(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/placeholder.png',
                        ),
                      ],
                    ),
                    footer: GridTileBar(
                      title: Text(
                        drink.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
