import 'package:consultant/src/themes/app_theme.dart';
import 'package:consultant/src/views/appointments/appointment_reschedule.dart';
import 'package:consultant/src/views/home/home_page.dart';
import 'package:consultant/src/views/profile/consultants_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_providers/all_providers.dart';
import '../appointments/appointments.dart';


class Base extends ConsumerStatefulWidget {
  static const id ='base';
  const Base({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BaseState();
}

class _BaseState extends ConsumerState<Base> {
  List<Widget> widgetList=[
    Homepage(),
    Appointments(),
    AppointmentReschedule(),
    ConsultantProfile(),

  ];
  int currentIndex =0;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final centralController = ref.read(centralProvider);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widgetList
      [currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppTheme.lightBlack,

        selectedItemColor: AppTheme.lightBlack,
        unselectedLabelStyle: GoogleFonts.dmSans(fontWeight:
        FontWeight.w500,fontSize: 12.sp,color: AppTheme.lightBlack),
        selectedLabelStyle: GoogleFonts.dmSans(fontWeight:
        FontWeight.w500,fontSize: 12.sp,color: AppTheme.lightBlack)
        ,
        unselectedFontSize: 12,
        backgroundColor: AppTheme.lightGreen,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: AppTheme.black,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded,color: AppTheme.black,),label: 'Appointments'),
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



//
// class Base extends StatefulWidget {
//   static const id ='base';
//   const Base({Key? key}) : super(key: key);
//
//   @override
//   State<Base> createState() => _BaseState();
// }
//
// class _BaseState extends State<Base> {
//   List<Widget> widgetList=[
//     Homepage(),
//     Appointments(),
//     AppointmentReschedule(),
//     ConsultantProfile(),
//
//   ];
//   int currentIndex =0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:widgetList
//         [currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: AppTheme.lightBlack,
//
//         selectedItemColor: AppTheme.lightBlack,
//         unselectedLabelStyle: GoogleFonts.dmSans(fontWeight:
//         FontWeight.w500,fontSize: 12.sp,color: AppTheme.lightBlack),
//         selectedLabelStyle: GoogleFonts.dmSans(fontWeight:
//         FontWeight.w500,fontSize: 12.sp,color: AppTheme.lightBlack)
//         ,
//         unselectedFontSize: 12,
//         backgroundColor: AppTheme.lightGreen,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: AppTheme.black,),label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded,color: AppTheme.black,),label: 'Appointments'),
//           BottomNavigationBarItem(icon: Image.asset("assets/calendar.png",height: 24,),label: 'Appointment \n Re-schedule '),
//           BottomNavigationBarItem(icon: Image.asset("assets/profile.png",height: 24,),label: 'Profile'),
//
//           // BottomNavigationBarItem(icon: Icon(Icons.calen))
//         ],
//
//         onTap: (index){
//           setState(() {
//             currentIndex=index;
//           });
//         },
//       ),
//     );
//   }
// }
