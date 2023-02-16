import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';


class Homepage extends ConsumerStatefulWidget {
  static const id='home_page';

  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
        AppTheme.lightGreen,
        body: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30.h),
                Row(
                  children: [
                    Image.asset('assets/app_logo.png',width: 87.w,height:77.h),
                    Spacer(),
                    Icon(Icons.notification_add
                    ,size: 16,color: AppTheme.primary,),
                    Column(
                      children: [
                        Column(
                          children: [
                            Text('Pending consultation \n with Dr. henry onah',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Icon(Icons.access_time,size: 16,color: AppTheme.primary,),
                              Text('1:35:27'),
                            ],
                          ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Gap(16.h),
                Row(
                  children: [
                    Avatar(),
                    Spacer(),
                    Column(
                      children: [
                        Row(

                          children: [
                            TimeWidget(time: '06',),Gap(8.w), TimeWidget(time: '1',),Gap(8.w), TimeWidget(time: '23',)

                          ],
                        ),
                        Text('Date')
                      ],
                    )
                    ],
                ),
                Gap(16.h),
                Row(
                  children: [
                    Text('Consultants Online',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 20.sp,fontWeight: FontWeight.w500)),
                    Gap(10),
                    CircleAvatar(radius: 3,backgroundColor: AppTheme.primary,),
                  ],
                ),
                Gap(16.h),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap:true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8),
                        child: ConsultantAvatar(),
                      );
                    }
                  ),
                ),
                Container(
                  height: 43.h,
                  width:382.w,
                  child:Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextField(

                      cursorColor: AppTheme.black2,
                      decoration: InputDecoration
                        (hintText: 'Search for a consultant by name or specialty',
                          hintStyle:
                          GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400) ,
                          prefixIcon: Icon(Icons.search,color:
                        AppTheme.black2,
                      ),
                      enabledBorder:
                          InputBorder.none,
                        focusedBorder: InputBorder.none


                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: AppTheme.white,borderRadius:
                      BorderRadius.circular(20)
                  ),
                ),
                Gap(16.h),

                Center(
                  child: Container(width: 295.w,height:259.h,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('15 tips to make your doctor\'s consultation better',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w500) ,),
                    )),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                    Color.fromRGBO(
                      224, 239, 48, 0.74),
                    Color.fromRGBO(72, 181, 83, 0.3922)
                  ],)),),
                ),
                Gap(24.h),
                Center(
                  child: Container(width: 295.w,height:259.h,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Tips for Effective Online Health',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w500) ,),
                    )),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[
                        Color.fromRGBO(
                            224, 239, 48, 0.74),
                        Color.fromRGBO(72, 181, 83, 0.3922)
                      ],)),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Icon(Icons.person,color:
            AppTheme.primary,),
          backgroundColor: AppTheme.white,
        ),

        Text('Margaret Elom',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w600))
      ],
    );
  }
}

class ConsultantAvatar extends StatelessWidget {
  const ConsultantAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
         backgroundImage: AssetImage('assets/consultant_image.png'),
          backgroundColor: AppTheme.white,
        ),
        Gap(8.h),
        Row(
          children: [
            Text('Dr Margaret Elom',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),
            Gap(5),
            CircleAvatar(radius: 3,backgroundColor: AppTheme.primary,),

          ],
        )
      ],
    );
  }
}

class TimeWidget extends StatelessWidget {
  String? time;
  TimeWidget({
    Key? key,this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height:
      32.h,width:32.w,child:Center(child: Text('$time')),decoration:
      BoxDecoration(borderRadius: BorderRadius
      .circular(5),color: AppTheme.white),);
  }
}
