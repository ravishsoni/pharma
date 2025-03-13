import 'package:flutter/material.dart';
import 'package:pharma/data/BottomNav.dart';

class DashboardScreen extends StatefulWidget {

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentBottomNavIndexVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavScreens[currentBottomNavIndexVal],
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: currentBottomNavIndexVal, 
          type: BottomNavigationBarType.shifting,
          onTap: (index) => { setState(() {
            currentBottomNavIndexVal = index;
          })},
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Color(0xff009c92)),
        BottomNavigationBarItem(icon: Icon(Icons.save), label: 'My Order', backgroundColor: Color(0xff009c92)),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Profile', backgroundColor: Color(0xff009c92))
      ]),
    );
  }

}