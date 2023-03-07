import 'package:crypto_app/view/home.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});
  static String id = 'NavBar page';

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _currentIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/1.1.png',
                height: myHeight * 0.03,
                color: Colors.grey,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/1.2.png',
                height: myHeight * 0.03,
                color: const Color(0xfffbc700),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/2.1.png',
                height: myHeight * 0.03,
                color: Colors.grey,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/2.2.png',
                height: myHeight * 0.03,
                color: const Color(0xfffbc700),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/3.1.png',
                height: myHeight * 0.03,
                color: Colors.grey,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/3.2.png',
                height: myHeight * 0.03,
                color: const Color(0xfffbc700),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/4.1.png',
                height: myHeight * 0.03,
                color: Colors.grey,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/4.2.png',
                height: myHeight * 0.03,
                color: const Color(0xfffbc700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
