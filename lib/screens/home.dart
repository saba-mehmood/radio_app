import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import 'radio_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [RadioPage(), new Text('page 2')];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: HexColor('#182545'),
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            selectedItemColor:HexColor('#fffff') ,
            currentIndex: _currentIndex,
            items: [
              _bottomNavItem(Icons.play_arrow, "Listen"),
              _bottomNavItem(Icons.favorite, "Favorite"),
            ],
            onTap: onTapTapped,
          ),
        ));
  }

  //bottom nav method for icon and title
  _bottomNavItem(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon, color: HexColor('#6d7381'),),
      activeIcon: Icon(icon, color: Colors.white,),
      title:Text(title).text.white.make(),
    );
  }

 //bottom nav tap method

void onTapTapped(int index){
    //error: setstate method called after disposed()?
  if(!mounted) return;
  setState(() {
    _currentIndex = index;
  });
}
}
