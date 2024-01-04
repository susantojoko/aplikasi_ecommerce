import 'package:aplikasi_ecommerce/favorite/favorite.dart';
import 'package:aplikasi_ecommerce/home/screens/home_screen.dart';
import 'package:aplikasi_ecommerce/home/screens/notifications_screen.dart';
import 'package:aplikasi_ecommerce/profile/profile_page.dart';
import 'package:flutter/material.dart';

class NavBarBottom extends StatefulWidget {
  final String authToken;

  const NavBarBottom({super.key, required this.authToken});

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  List pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(authToken: widget.authToken),
      NotificationPage(authToken: widget.authToken),
      FavoritePage(authToken: widget.authToken),
      ProfilePage(authToken: widget.authToken),
    ];
  }

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: onTap,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
