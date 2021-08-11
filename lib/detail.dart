import 'package:flutter/material.dart';

import 'Restaurant.dart';

class Detail extends StatelessWidget {
   
   
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const Detail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resto (Rest to Eat)',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: restaurant.pictureId,
                child: Image.network(restaurant.pictureId)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          restaurant.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                restaurant.city,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                restaurant.rating.toString(),
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.green),
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.justify,
                  ),
                  Divider(color: Colors.green),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Food List',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Drink List',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: restaurant.menus.foods.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  '- ' + restaurant.menus.foods[index].name);
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: restaurant.menus.drinks.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  '- ' + restaurant.menus.drinks[index].name);
                            }),
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
}