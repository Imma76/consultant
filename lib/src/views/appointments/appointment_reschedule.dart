import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../themes/app_theme.dart';
import '../home/home_page.dart';



class AppointmentReschedule extends ConsumerStatefulWidget {
  const AppointmentReschedule({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppointmentRescheduleState();
}

class _AppointmentRescheduleState extends ConsumerState<AppointmentReschedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor:
        AppTheme.lightGreen,

        body: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30.h),
              Row(

                children: [
                  Image.asset('assets/app_logo.png',width: 87.w,height:77.h),
                  Spacer(),
                  // Icon(Icons.notification_add
                  // ,size: 16,color: AppTheme.primary,),
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Avatar(),
                  )

                ],
              ),
              Gap(16.h),
              Row(
                children: [
                  Image.asset('assets/notification_bell.png',height:16.h, width:16.w),Gap(5.w),

                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:3.0),
                      child: Text('Appointments',style:  GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500) ),
                    ),
                  ),
                  Spacer(),
                  Column(

                    mainAxisAlignment:
                    MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Row(

                          children: [
                            TimeWidgetReSchedule(time: '06',),Gap(8.w), TimeWidget(time: '1',),Gap(8.w), TimeWidget(time: '23',)

                          ],
                        ),
                      ),
                      Gap(5),
                      Text('Date',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500) )
                    ],
                  )
                ],
              ),
              Gap(16.h),
              Text('Today',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
              Gap(24.h),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppointmentCard(index: index,),
                    );
                  }
              ),
              Gap(20),
              Text('Yesterday',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
              Gap(10.h),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppointmentCard(index: 5,),
                    );
                  }
              ),
            ],
          ),
        ),

      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  int? index;
   AppointmentCard({
    Key? key,this.index
  }) : super(key: key);
 List month=['','January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height:48.h,width:382.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('John Dalton 1:00 - 1:45 PM  ',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),


            Spacer(),
            GestureDetector(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return Dialog(
                    child:  Container(
                      width:378.w,
                      height:550.h,
                      color: AppTheme.white,
                      child:  Container(


                        color: AppTheme.lightGreen
                        ,
                        child: TableCalendar(
                          weekNumbersVisible:
                          false
                          ,

                          availableCalendarFormats:
                          {
                            CalendarFormat.month: 'Month',
                          },
                          daysOfWeekHeight:
                          40,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                          currentDay: DateTime.now(),
                          headerStyle: HeaderStyle(titleCentered: true,titleTextStyle:GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,fontSize: 16.sp,
                          ),headerPadding: EdgeInsets.only(bottom: 8,top:20),titleTextFormatter: (date,string){
                            return '${month[date.month]} \n ${date.year}';
                          }),
                          daysOfWeekStyle:
                          DaysOfWeekStyle(decoration: BoxDecoration()),
                          calendarStyle: CalendarStyle(
                              cellPadding: EdgeInsets.all(4),
                              //    markerDecoration : const BoxDecoration(color: const Color(0xFF263238), shape: BoxShape.circle),
                              //  todayTextStyle : const TextStyle(color: AppTheme.black, fontSize: 16.0),
                              //
                              //todayDecoration : const BoxDecoration(color: AppTheme.black, shape: BoxShape.circle),
                              //    selectedTextStyle : const TextStyle(color: const Color(0xFFFAFAFA), fontSize: 16.0),
                              // selectedDecoration : const BoxDecoration(color: AppTheme.white, shape: BoxShape.circle),
                              //  rangeStartTextStyle : const TextStyle(color: const Color(0xFFFAFAFA), fontSize: 16.0),
                              // rangeStartDecoration : const BoxDecoration(color: const Color(0xFF6699FF), shape: BoxShape.circle),
                              //
                              //  rangeEndTextStyle :const TextStyle(color: const Color(0xFFFAFAFA), fontSize: 16.0),
                              //    rangeEndDecoration : const BoxDecoration(color: const Color(0xFF6699FF), shape: BoxShape.circle),
                              //    withinRangeTextStyle : const TextStyle(),
                              //   defaultDecoration :const BoxDecoration(shape: BoxShape.circle,color: AppTheme.black),
                              //  // rowDecoration : const BoxDecoration(color: AppTheme.lightGreen),
                              tableBorder : const TableBorder(
                                // horizontalInside: BorderSide(color: AppTheme.black,strokeAlign: StrokeAlign.outside)
                              ),
                              tablePadding: EdgeInsets.only(bottom:10,right: 10,left:
                              10)
                            //  rowDecoration:BoxDecoration(color: AppTheme.lightGreen),

                          ),
                          // selectedDayPredicate: (date){
                          //
                          //
                          //  if (date.day!=DateTime.now().day){
                          //
                          //   // return false;
                          //  }
                          //
                          // // return true;
                          // },
                          calendarBuilders: CalendarBuilders(
                              todayBuilder:  (BuildContext context, DateTime date, _) {
                                return Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: GestureDetector(
                                    onTap: (){

                                      Navigator.pop(context);
                                      showDialog(context: context, builder: (context){

                                        return Dialog(
                                          child:Container(
                                            height:238.h,
                                          width:382.w,
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Gap(16.h),
                                                Text('Create a new slot'
                                              ,style:GoogleFonts.poppins(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w400,
                                                        color:
                                                        //  AppTheme.red
                                                        AppTheme.lightBlack.withOpacity(0.6)
                                                    )),

                                                Gap(32.h),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height:43.h,
                                                      width:43.w,
                                                      child: TextField
                                                        (),
                                                      decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                      Border.all(color:AppTheme.lightBlack))
                                                    ),
                                                    Gap(8.w),
                                                    Column(

                                                      children: [
                                                        CircleAvatar(radius: 2,backgroundColor
                                                            :AppTheme.lightBlack),

                                                        Gap(10.h),
                                                        CircleAvatar(radius: 2,backgroundColor: AppTheme.lightBlack,),

                                                      ],
                                                    ),
                                                    Gap(8.w),
                                                    Container(
                                                      height:43.h,
                                                      width:43.w,

                                                      child: TextField(),

                                                      decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                      Border.all(color:AppTheme.lightBlack,))
                                                    ),
                                                    Gap(42.w),

                                                    Container(
                                                        height:22.h,
                                                        width:30.w,
                                                        child: Center(
                                                          child: Text
                                                            ('AM',style:GoogleFonts.poppins(
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              //  AppTheme.red
                                                              AppTheme.lightBlack.withOpacity(0.6)
                                                          )),
                                                        ),
                                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                        Border.all(color:AppTheme.lightBlack))
                                                    ),
                                                    Gap(8.w),

                                                    Container(
                                                        height:22.h,
                                                        width:30.w,
                                                        child: Center(
                                                          child: Text
                                                            ('PM',style:GoogleFonts.poppins(
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              //  AppTheme.red
                                                              AppTheme.lightBlack.withOpacity(0.6)
                                                          )),
                                                        ),
                                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                        Border.all(color:AppTheme.lightBlack))
                                                    ),
                                                  ],
                                                ),
                                                Gap(41.h),
                                                ElevatedButton(onPressed: (){
                                                  Navigator.pop(context);
                                                  showDialog(context: context, builder: (context){

                                                    return Dialog(
                                                        child:Container(
                                                          height:238.h,
                                                          width:382.w,
                                                          child:Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Gap(16.h),
                                                                  Image.asset('assets/check.png',height:64.h,width:64.w),
                                                              Gap(8.h),
                                                              Text('Appointment Rescheduled',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 20.sp,fontWeight: FontWeight.w500)),

                                                              Gap(24.h),
                                                              ElevatedButton(onPressed: (){

                                                                Navigator.pop(context);

                                                              }, child:Text('Done',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(154.w,40.h)), ),


                                                            ],
                                                          ),
                                                          decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(10),),

                                                        )
                                                    );
                                                  });

                                                }, child:Text('Create slot',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 16.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(154.w,40.h)), ),


                                              ],
                                            ),
                                            decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(10),),

                                          )
                                        );
                                      });
                                     // Navigator.pushNamed(context, SelectTimeSlot.id);
                                      },
                                    child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left:5,right:5),

                                        child: Text(date.day
                                            .toString(),
                                          style: GoogleFonts.inter(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color:
                                              //  AppTheme.red
                                              AppTheme.lightBlack),),   decoration: BoxDecoration(
                                      color: AppTheme.white
                                      ,border:
                                    Border.symmetric(
                                      vertical: BorderSide(
                                          color: AppTheme.black
                                      ),
                                      horizontal: BorderSide(
                                          color: AppTheme.black
                                      ),

                                    ),


                                    )),
                                  ),
                                );
                              },
                              defaultBuilder:
                                  (BuildContext context, DateTime date, _) {



                                return GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                    showDialog(context: context, builder: (context){

                                      return Dialog(
                                          child:Container(
                                            height:238.h,
                                            width:382.w,
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Gap(16.h),
                                                Text('Create a new slot'
                                                    ,style:GoogleFonts.poppins(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w400,
                                                        color:
                                                        //  AppTheme.red
                                                        AppTheme.lightBlack.withOpacity(0.6)
                                                    )),

                                                Gap(32.h),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        height:43.h,
                                                        width:43.w,
                                                        child: TextField
                                                          (),
                                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                        Border.all(color:AppTheme.lightBlack))
                                                    ),
                                                    Gap(8.w),
                                                    Column(

                                                      children: [
                                                        CircleAvatar(radius: 2,backgroundColor
                                                            :AppTheme.lightBlack),

                                                        Gap(10.h),
                                                        CircleAvatar(radius: 2,backgroundColor: AppTheme.lightBlack,),

                                                      ],
                                                    ),
                                                    Gap(8.w),
                                                    Container(
                                                        height:43.h,
                                                        width:43.w,

                                                        child: TextField(),

                                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                        Border.all(color:AppTheme.lightBlack,))
                                                    ),
                                                    Gap(42.w),

                                                    Container(
                                                        height:22.h,
                                                        width:30.w,
                                                        child: Center(
                                                          child: Text
                                                            ('AM',style:GoogleFonts.poppins(
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              //  AppTheme.red
                                                              AppTheme.lightBlack.withOpacity(0.6)
                                                          )),
                                                        ),
                                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                        Border.all(color:AppTheme.lightBlack))
                                                    ),
                                                    Gap(8.w),

                                                    Container(
                                                        height:22.h,
                                                        width:30.w,
                                                        child: Center(
                                                          child: Text
                                                            ('PM',style:GoogleFonts.poppins(
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              //  AppTheme.red
                                                              AppTheme.lightBlack.withOpacity(0.6)
                                                          )),
                                                        ),
                                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                        Border.all(color:AppTheme.lightBlack))
                                                    ),
                                                  ],
                                                ),
                                                Gap(41.h),
                                                ElevatedButton(onPressed: (){
                                                  Navigator.pop(context);
                                                  showDialog(context: context, builder: (context){

                                                    return Dialog(
                                                        child:Container(
                                                          height:238.h,
                                                          width:382.w,
                                                          child:Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Gap(16.h),
                                                              Image.asset('assets/check.png',height:64.h,width:64.w),
                                                              Gap(8.h),
                                                              Text('Appointment Rescheduled',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 20.sp,fontWeight: FontWeight.w500)),

                                                              Gap(24.h),
                                                              ElevatedButton(onPressed: (){

                                                                Navigator.pop(context);

                                                              }, child:Text('Done',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(154.w,40.h)), ),


                                                            ],
                                                          ),
                                                          decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(10),),

                                                        )
                                                    );
                                                  });

                                                }, child:Text('Create slot',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 16.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(154.w,40.h)), ),


                                              ],
                                            ),
                                            decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(10),),

                                          )
                                      );
                                    });
                                  //  Navigator.pushNamed(context, SelectTimeSlot.id);
                                    },
                                  child : Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left:5,right:5),

                                        child: Text(date.day
                                            .toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                //  AppTheme.red
                                                AppTheme.lightBlack)),   decoration: BoxDecoration(
                                      color: AppTheme.white,border:
                                    Border.symmetric(
                                      vertical: BorderSide(
                                          color: AppTheme.black
                                      ),horizontal: BorderSide(
                                        color: AppTheme.black
                                    ),
                                    ),
                                      // borderRadius:
                                      // BorderRadius.all(Radius.circular(1)
                                      // )


                                    )),
                                  ),
                                );
                              }, outsideBuilder: (context, date, _) {
                            return GestureDetector(
                              onTap: (){
                               // Navigator.pushNamed(context, SelectTimeSlot.id);
                                Navigator.pop(context);
                                showDialog(context: context, builder: (context){

                                  return Dialog(
                                      child:Container(
                                        height:238.h,
                                        width:382.w,
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Gap(16.h),
                                            Text('Create a new slot'
                                                ,style:GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    //  AppTheme.red
                                                    AppTheme.lightBlack.withOpacity(0.6)
                                                )),

                                            Gap(32.h),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height:43.h,
                                                    width:43.w,
                                                    child: TextField
                                                      (),
                                                    decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                    Border.all(color:AppTheme.lightBlack))
                                                ),
                                                Gap(8.w),
                                                Column(

                                                  children: [
                                                    CircleAvatar(radius: 2,backgroundColor
                                                        :AppTheme.lightBlack),

                                                    Gap(10.h),
                                                    CircleAvatar(radius: 2,backgroundColor: AppTheme.lightBlack,),

                                                  ],
                                                ),
                                                Gap(8.w),
                                                Container(
                                                    height:43.h,
                                                    width:43.w,

                                                    child: TextField(),

                                                    decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                    Border.all(color:AppTheme.lightBlack,))
                                                ),
                                                Gap(42.w),

                                                Container(
                                                    height:22.h,
                                                    width:30.w,
                                                    child: Center(
                                                      child: Text
                                                        ('AM',style:GoogleFonts.poppins(
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w400,
                                                          color:
                                                          //  AppTheme.red
                                                          AppTheme.lightBlack.withOpacity(0.6)
                                                      )),
                                                    ),
                                                    decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                    Border.all(color:AppTheme.lightBlack))
                                                ),
                                                Gap(8.w),

                                                Container(
                                                    height:22.h,
                                                    width:30.w,
                                                    child: Center(
                                                      child: Text
                                                        ('PM',style:GoogleFonts.poppins(
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w400,
                                                          color:
                                                          //  AppTheme.red
                                                          AppTheme.lightBlack.withOpacity(0.6)
                                                      )),
                                                    ),
                                                    decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(5),border:
                                                    Border.all(color:AppTheme.lightBlack))
                                                ),
                                              ],
                                            ),
                                            Gap(41.h),
                                            ElevatedButton(onPressed: (){
                                              Navigator.pop(context);
                                              showDialog(context: context, builder: (context){

                                                return Dialog(
                                                    child:Container(
                                                      height:238.h,
                                                      width:382.w,
                                                      child:Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Gap(16.h),
                                                          Image.asset('assets/check.png',height:64.h,width:64.w),
                                                          Gap(8.h),
                                                          Text('Appointment Rescheduled',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 20.sp,fontWeight: FontWeight.w500)),

                                                          Gap(24.h),
                                                          ElevatedButton(onPressed: (){

                                                            Navigator.pop(context);

                                                          }, child:Text('Done',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(154.w,40.h)), ),


                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(10),),

                                                    )
                                                );
                                              });

                                            }, child:Text('Create slot',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 16.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(154.w,40.h)), ),


                                          ],
                                        ),
                                        decoration: BoxDecoration(color:AppTheme.white,borderRadius: BorderRadius.circular(10),),

                                      )
                                  );
                                });
                                },
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Container(
                                  //  height: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left:5,right:5),
                                    decoration: BoxDecoration(
                                      color: AppTheme.white,border:
                                    Border.symmetric(
                                      vertical: BorderSide(
                                          color: AppTheme.black
                                      ),horizontal: BorderSide(
                                        color: AppTheme.black
                                    ),
                                    ),),
                                    child: Text(
                                        '${date.day}',
                                        style: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color:
                                            //  AppTheme.red
                                            AppTheme.lightBlack.withOpacity(0.6)
                                        ))),
                              ),
                            );
                          }),



                        ),
                      ),
                    )
                    ,
                  ) ;


                });
                },
              child:index== 5? Text('(Session Ended)',style:  GoogleFonts.dmSans(color: AppTheme.lightBlack,fontSize: 12.sp,fontWeight: FontWeight.w500)): Container(
                height: 26.h,
                  width: 115.w,

                  decoration: BoxDecoration(
                    color: AppTheme.primary2,
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: Center(child: Text('Reschedule',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 12.sp,fontWeight: FontWeight.w700)))),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(color: AppTheme.white),
    );
  }
}


class TimeWidgetReSchedule extends StatelessWidget {
  String? time;
  TimeWidgetReSchedule({
    Key? key,this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height:
    32.h,width:32.w,child:Center(child: Text('$time',style: GoogleFonts.inter(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400))),decoration:
    BoxDecoration(borderRadius: BorderRadius
        .circular(5),color: AppTheme.white),);
  }
}
