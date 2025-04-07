import 'package:flutter/material.dart';
import 'section_title.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({super.key});

  @override
  Widget build(BuildContext context) {
    // List of brand logos and names
    final List<Map<String, dynamic>> brands = [
      {
        "image": "assets/images/brand1.png",
        "name": "Auto Miraj",
      },
      {
        "image": "assets/images/brand2.png",
        "name": "Kleen Park",
      },
      {
        "image": "assets/images/brand3.png",
        "name": "Care Point",
      },
      {
        "image": "assets/images/brand4.png",
        "name": "Platinum Auto Spa",
      },
      {
        "image": "assets/images/brand5.png",
        "name": "Magic Touch-up",
      },
      {
        "image": "assets/images/brand6.png",
        "name": "Laugfs",
      },
      {
        "image": "assets/images/brand7.png",
        "name": "Hybrid Motors",
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Top Service Centers",
            press: () {
              // Navigate to brands screen when implemented
            },
          ),
        ),
        const SizedBox(height: 5), 
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                brands.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 20 : 5, 
                    right: index == brands.length - 1 ? 20 : 5, 
                  ),
                  child: BrandCard(
                    image: brands[index]["image"],
                    name: brands[index]["name"],
                    press: () {
                      // Handle brand press
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.image,
    required this.name,
    required this.press,
  });

  final String image;
  final String name;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 80, 
        height: 110, 
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 3), // Reduced from 5 to 3
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11, // Reduced from 12 to 11
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}