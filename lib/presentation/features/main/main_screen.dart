import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/features/main/pages/home_page.dart';
import 'package:flutter_clean_architecture/presentation/features/main/pages/notifications_page.dart';
import 'package:flutter_clean_architecture/presentation/features/main/pages/search_page.dart';
import 'package:flutter_clean_architecture/presentation/features/main/pages/settings_page.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> listOfPages = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage(),
  ];

  List<String> listOfTitles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];

  var title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: listOfPages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ColorManager.lightGrey,
                  spreadRadius: AppSizes.s1
              ),
            ]
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: (value){
            onTap(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: AppStrings.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: AppStrings.notifications,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: AppStrings.settings,
            ),
          ],
        ),
      ),
    );
  }

  onTap(int index){
    _currentIndex = index;
    title = listOfTitles[index];
    setState(() {});
  }

}
