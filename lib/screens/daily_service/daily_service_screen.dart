import 'package:flutter/material.dart';

class DailyGiftScreen extends StatefulWidget {
  static const String routeName = '/daily-gift';

  const DailyGiftScreen({Key? key}) : super(key: key);

  @override
  _DailyGiftScreenState createState() => _DailyGiftScreenState();
}

class _DailyGiftScreenState extends State<DailyGiftScreen> {
  final List<Map<String, dynamic>> _dailyGifts = [
    {
      'id': 1,
      'name': 'Oil Change',
      'description': 'Regular oil changes keep your engine running smooth and efficient.',
      'image': 'assets/images/s1.png',
      'remaining': 5,
      'claimed': false,
    },
    {
      'id': 2,
      'name': 'Brake Inspection and Repair',
      'description': 'Brake service ensures safety by maintaining stopping power and performance.',
      'image': 'assets/images/s2.png',
      'remaining': 3,
      'claimed': false,
    },
    {
      'id': 3,
      'name': 'Engine Diagnostics',
      'description': 'Computerized diagnostics help identify issues before they become serious.',
      'image': 'assets/images/s3.png',
      'remaining': 7,
      'claimed': false,
    },
    {
      'id': 4,
      'name': 'Tire Services (Rotation, Alignment, Replacement)',
      'description': 'Proper tire maintenance improves driving safety, comfort, and fuel efficiency.',
      'image': 'assets/images/s4.png',
      'remaining': 7,
      'claimed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Services'),
      ),
      body: _dailyGifts.isEmpty
          ? const Center(
              child: Text('No Services available today.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _dailyGifts.length,
              itemBuilder: (context, index) {
                final gift = _dailyGifts[index];
                return DailyGiftCard(
                  gift: gift,
                  onClaim: () => _claimGift(index),
                );
              },
            ),
    );
  }

  void _claimGift(int index) {
    final gift = _dailyGifts[index];
    if (gift['remaining'] > 0 && !gift['claimed']) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Daily Services'),
          content: Text('Are you sure you want to claim the ${gift['name']}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _dailyGifts[index]['remaining']--;
                  _dailyGifts[index]['claimed'] = true;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${gift['name']} claimed successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Claim'),
            ),
          ],
        ),
      );
    } else if (gift['claimed']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You have already claimed this services today.'),
          backgroundColor: Colors.orange,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No more services available today.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class DailyGiftCard extends StatelessWidget {
  final Map<String, dynamic> gift;
  final VoidCallback onClaim;

  const DailyGiftCard({
    Key? key,
    required this.gift,
    required this.onClaim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[200],
                child: Center(
                  child: Image.asset(
                    gift['image'],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Remaining: ${gift['remaining']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gift['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  gift['description'],
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: gift['remaining'] > 0 && !gift['claimed']
                        ? onClaim
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gift['claimed'] ? Colors.grey : null,
                    ),
                    child: Text(
                      gift['claimed']
                          ? 'Claimed'
                          : gift['remaining'] > 0
                              ? 'Claim Service'
                              : 'Not Available',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}