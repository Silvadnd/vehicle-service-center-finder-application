import 'package:auto_fix_lk/screens/Specialized_Parts/Specialized_Parts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:auto_fix_lk/screens/game_deal/game_deal_screen.dart';
import 'package:auto_fix_lk/screens/daily_service/daily_service_screen.dart';
import 'package:auto_fix_lk/screens/sell/sell_screen.dart';
import 'package:auto_fix_lk/screens/location/location_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "High-End"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Services"},
     // {"icon": "assets/icons/Settings.svg", "text": "Feed"},
      {"icon": "assets/icons/Bell.svg", "text": "Activity"},
      {"icon": "assets/icons/Location point.svg", "text": "Location"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              if (categories[index]["text"] == "High-End") {
                Navigator.pushNamed(context, GameDealScreen.routeName);
              } else if (categories[index]["text"] == "Services") {
                Navigator.pushNamed(context, DailyGiftScreen.routeName);
              } else if (categories[index]["text"] == "Activity") {
                Navigator.pushNamed(context, SellScreen.routeName);
              } else if (categories[index]["text"] == "Location") {
                Navigator.pushNamed(context, LocationScreen.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}