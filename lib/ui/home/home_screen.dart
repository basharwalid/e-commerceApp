import 'package:ecommerce/Core/Theme/my_theme.dart';
import 'package:ecommerce/ui/home/bottom_nav_icon.dart';
import 'package:ecommerce/ui/home/tabs/CategoryTab/Categories_tab.dart';
import 'package:ecommerce/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SearchBar(
                      backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ImageIcon(
                    const AssetImage("assets/images/ic_cart.png"),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
            color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          type:BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: BottomNavIcon(
                  IconName: "ic_home",
                  isSelected: selectedIndex == 0,
                ),
                backgroundColor: Colors.transparent,
                label: ""),
            BottomNavigationBarItem(
                icon: BottomNavIcon(
                  IconName: "ic_category",
                  isSelected: selectedIndex == 1,
                ),
                backgroundColor: Colors.transparent,
                label: ""),
            BottomNavigationBarItem(
                icon: BottomNavIcon(
                  IconName: "ic_favorite",
                  isSelected: selectedIndex == 2,
                ),
                backgroundColor: Colors.transparent,
                label: ""),
            BottomNavigationBarItem(
                icon: BottomNavIcon(
                  IconName: "ic_account",
                  isSelected: selectedIndex == 3,
                ),
                backgroundColor: Colors.transparent,
                label: ""),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    CategoriesTab(),
    CategoriesTab(),
  ];
}

