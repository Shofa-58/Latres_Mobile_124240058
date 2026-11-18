import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});
  final RxInt _index = 0.obs;
  final List<Widget> _pages = [HomePage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[_index.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index.value,
            onTap: (i) => _index.value = i,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorit'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
            ],
          ),
        ));
  }
}