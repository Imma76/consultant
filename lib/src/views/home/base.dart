import 'package:consultant/src/themes/app_theme.dart';
import 'package:consultant/src/views/home/home_page.dart';
import 'package:flutter/material.dart';


class Base extends StatefulWidget {
  static const id ='base';
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  List<Widget> widgetList=[
    Homepage(),
    Homepage(),
    Homepage(),
    Homepage(
    ),
  ];
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widgetList
        [currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,

        selectedItemColor: Colors.black,
        unselectedFontSize: 12,
        backgroundColor: AppTheme.lightGreen,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: AppTheme.black,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded),label: 'Appointments'),
          BottomNavigationBarItem(icon: Image.asset("assets/calendar.png",height: 24,),label: 'Appointment \n Re-schedule '),
          BottomNavigationBarItem(icon: Image.asset("assets/profile.png",height: 24,),label: 'Profile'),

          // BottomNavigationBarItem(icon: Icon(Icons.calen))
        ],

        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}
