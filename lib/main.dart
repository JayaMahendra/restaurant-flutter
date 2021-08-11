import 'package:flutter/material.dart';
import 'package:restaurant_app/Restaurant.dart';
import 'package:restaurant_app/splashScreen.dart';
import 'detail.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, 
  home: SplashScreen(), 

  routes: {
    _HomeState.routeName: (context) => Home(),
    Detail.routeName: (context) => Detail(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
    SplashScreen.routeName: (context) => SplashScreen()
  }));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const routeName = '/restaurant_home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 60,
              title: Text('Restaurant'),
              backgroundColor: Color(0xFFFF1744)),
          body: Container(
              child: 
               FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/local_restaurant.json'),
                  builder: (context, snapshot) {
                    final List<Restaurant> restaurant =
                        parseRestaurants(snapshot.data);
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return ListView.builder(
                        itemCount: restaurant.length,
                        itemBuilder: (context, index) {
                          return Container(
                              child: Column(children: [
                            _buildRestaurantItem(context, restaurant[index])
                          ]));
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          )
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          restaurant.pictureId,
          width: 100,
        ),
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(restaurant.city),
            ],
          ),
          Row(
            children: [
              Text(restaurant.rating.toString()),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, Detail.routeName, arguments: restaurant);
      },
    );
  }
}
