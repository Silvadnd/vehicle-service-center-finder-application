import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_fix_lk/constants.dart';
import 'package:auto_fix_lk/screens/favorite/favorite_screen.dart';
import 'package:auto_fix_lk/screens/home/home_screen.dart';
import 'package:auto_fix_lk/screens/profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ChatPage(), 
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile", 
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'How do I request roadside assistance?',
      'answer': 'You can request roadside assistance through our app by clicking on the "Emergency Service" button on the home screen and sharing your location. Our nearest service provider will be notified and reach you as soon as possible.',
      'isExpanded': false,
    },
    {
      'question': 'What should I do if my vehicle breaks down?',
      'answer': 'Stay calm and move your vehicle to a safe location if possible. Open our app, use the emergency service feature, and wait for assistance. Our service providers are available 24/7.',
      'isExpanded': false,
    },
    {
      'question': 'How can I track my service provider\'s location?',
      'answer': 'Once a service provider accepts your request, you can track their real-time location through the Google Maps integration in our app. You\'ll see an estimated arrival time and their current position.',
      'isExpanded': false,
    },
    {
      'question': 'How do I purchase vehicle accessories through the app?',
      'answer': 'Browse our extensive catalog in the "Products" section, select the items you want, add them to your cart, and proceed to checkout. We offer secure payment options and delivery services.',
      'isExpanded': false,
    },
    {
      'question': 'What payment methods are accepted?',
      'answer': 'We accept various payment methods including credit/debit cards, mobile payments, and cash on delivery for products. For emergency services, you can pay directly to the service provider.',
      'isExpanded': false,
    },
    {
      'question': 'How can I find the nearest service center?',
      'answer': 'Use the "Top Service Centers" section in our app or enable location services to find the nearest service centers. You can view ratings, services offered, and contact information for each center.',
      'isExpanded': false,
    },
    {
      'question': 'What types of vehicle services do you offer?',
      'answer': 'We offer a wide range of services including emergency repairs, routine maintenance, tire services, battery replacement, engine diagnostics, and more. Check the service details in our app for a complete list.',
      'isExpanded': false,
    },
    {
      'question': 'How do I cancel a service request?',
      'answer': 'You can cancel a service request through the app before a service provider accepts it. Go to your active requests and click the cancel button. If a provider has already accepted, please call them directly.',
      'isExpanded': false,
    },
    {
      'question': 'Is there a warranty on purchased accessories?',
      'answer': 'Yes, all accessories purchased through our app come with a manufacturer\'s warranty. The warranty period varies by product and is clearly mentioned in the product description.',
      'isExpanded': false,
    },
    {
      'question': 'How can I rate and review a service?',
      'answer': 'After each service completion, you\'ll receive a notification to rate your experience. You can also go to your service history to leave ratings and reviews for past services.',
      'isExpanded': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat With Us'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: const EdgeInsets.all(8),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _faqs[index]['isExpanded'] = !_faqs[index]['isExpanded'];
              });
            },
            children: _faqs.map<ExpansionPanel>((Map<String, dynamic> faq) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      faq['question'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                body: ListTile(
                  title: Text(
                    faq['answer'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                isExpanded: faq['isExpanded'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}