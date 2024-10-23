import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rpp/features/home/presentation/view/home_view.dart';
import 'package:rpp/features/notice/widgets/news_view.dart';
import 'package:rpp/features/profile/presentation/view/profile_view.dart';
import 'package:rpp/features/program/presentation/view/program_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  int selectedIndex = 0;
  List<Widget> lstScreen = [
    const HomeView(),
    const NewsView(),
    const ProgramView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstScreen[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the BottomNavigationBar
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), // Adjust to create curve
            topRight: Radius.circular(30), // Adjust to create curve
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow effect
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors
              .transparent, // Make it transparent to see the curved container
          elevation: 0, // Remove elevation for a smooth look
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.document),
              label: 'Notice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.calendar_2),
              label: 'Program',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.menu),
              label: 'Other',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red, // Red for selected icons
          unselectedItemColor: Colors.black, // Black for unselected icons
          selectedLabelStyle:
              const TextStyle(color: Colors.red), // Red for selected label
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedIconTheme: const IconThemeData(
              color: Colors.amberAccent), // Yellow for selected icons
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
