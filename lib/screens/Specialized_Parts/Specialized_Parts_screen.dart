import 'package:flutter/material.dart';

class GameDealScreen extends StatelessWidget {
  static const String routeName = '/game_deal';

  final List<Map<String, dynamic>> flashDeals = [
    {
      "name": "ECU",
      "price": 250000,
      "originalPrice": 300000,
      "discount": 17,
      "image": "assets/images/d1.png",
      "delivery": "FREE DELIVERY",
      "stock": "In stock",
    },
    {
      "name": "Radiator",
      "price": 45000,
      "originalPrice": 50000,
      "discount": 10,
      "image": "assets/images/d2.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 2 left!",
    },
    {
      "name": "Head Gasket",
      "price": 35000,
      "originalPrice": 40000,
      "discount": 12,
      "image": "assets/images/d3.png",
      "delivery": "FREE DELIVERY",
      "stock": "On sale now",
    },
    {
      "name": "Turbocharger",
      "price": 120000,
      "originalPrice": 150000,
      "discount": 20,
      "image": "assets/images/d4.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 1 left!",
    },
    {
      "name": "Timing Belt",
      "price": 38000,
      "originalPrice": 50000,
      "discount": 10,
      "image": "assets/images/d5.png",
      "delivery": "FREE DELIVERY",
      "stock": "In stock",
    },
     {
      "name": "Dual Mass Flywheel",
      "price": 18000,
      "originalPrice": 20000,
      "discount": 10,
      "image": "assets/images/d6.png",
      "delivery": "FREE DELIVERY",
      "stock": "In stock",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More Expensive/Specialized Parts"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: flashDeals.length,
        itemBuilder: (context, index) {
          final deal = flashDeals[index];
          return Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    deal["image"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deal["name"],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Rs. ${deal["price"]}",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs. ${deal["originalPrice"]}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "${deal["discount"]}% off",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        deal["delivery"],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        deal["stock"],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
