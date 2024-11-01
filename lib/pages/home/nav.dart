import 'package:duzo/pages/home/home.dart';
import 'package:duzo/pages/home/profile.dart';
import 'package:duzo/palette.dart';
import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: CustomPalette.lightPeach,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 18, 38, 221),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '▬',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_outlined),
              label: '▬',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              label: '▬',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '▬',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    
    );
  }
  AppBar _buildAppBar() {
    double height = MediaQuery.sizeOf(context).height;
    return AppBar(
      backgroundColor: CustomPalette.lightYellow,
        title: Container(
            child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                  height: height*0.07,
                ),
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_selectedIndex == 3 ? 0 : 30)
          ),
        ),
    );
  }
}