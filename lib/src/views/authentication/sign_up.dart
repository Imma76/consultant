import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/utils/widgets/loader.dart';
import 'package:consultant/src/views/authentication/great_job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../utils/widgets/reusable_widget.dart';


class SignUpScreen extends ConsumerStatefulWidget {
  static const id = 'sign_up';
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUpScreen> {
  List<Widget> formList=[
    Field1(),
    Field2(),
    Field3(),
    Field4(),

  ];
  int currentIndex=0;
  PageController pageController= PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(authProvider);
    final centralController = ref.read(centralProvider);
  }
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authProvider);
    final centralController = ref.watch(centralProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left:24.w,right:24.w),
            child: Column(
              children: [
                Gap(35.h),
                Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: Image.asset('assets/app_logo.png',width:87.w, height:77.h),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text('Sign up as a consultant',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 24.sp,fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
                Gap(80.h),

                SizedBox(
                  height: 456.h,
                  child: PageView.builder(
                    controller: pageController,
                      itemCount: formList.length,
                      onPageChanged:(int){
                      setState(() {
                        currentIndex=int;
                      });
                      },
                      itemBuilder: (context,index){

                    return formList[index];
                  }),
                ),
                SizedBox(
                  height:20.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: formList.length,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(backgroundColor:currentIndex==index? AppTheme.primary:AppTheme.white2,radius: 3),
                      );
                    }
                  ),
                ),
                Gap(44.h),
                centralController
                    .isAppLoading?Indicator2(color: AppTheme.white,):    ElevatedButton(onPressed: ()async{
                  pageController
                  .nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
                  if(currentIndex ==3){

                  if(authController.checkInputForSignUp()){
                    await authController.signUp(centralController);
                  }
                  }
                }, child:Text(currentIndex !=3?'Next':'Sign up',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(382.w,58.h)), ),
Gap(40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Field1 extends ConsumerWidget {
  const Field1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final authController = ref.watch(authProvider);
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Text('First Name',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(

              controller:authController.firstNameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),
        Gap(24.h),
        Text('Last Name',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller: authController.lastNameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),

        Gap(24.h),
        Text('Email address',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller: authController.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ), Gap(24.h),
        Text('Enter a password',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller: authController.passwordController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),

      ],
    );
  }
}



class Field2 extends ConsumerWidget {
  const Field2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final authController = ref.watch(authProvider);
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text('Phone number',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller: authController.phoneNoController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),
        Gap(24.h),
        Text('Select State of origin',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller: authController.stateOfOriginController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),
        Gap(24.h),
        Text('Select local government of origin',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller: authController.lgaController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),

        Gap(24.h),
        Text('Age',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
        Gap(8.h),
        SizedBox(
          height:
          60.h,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              controller:
              authController.ageController,
              decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class Field3 extends ConsumerWidget {
  const Field3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final authController = ref.watch(authProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text('Gender',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            60.h,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(

                controller: authController.genderController
                ,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                ),
              ),
            ),
          ),
          Gap(24.h),
          Text('Residential address',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            60.h,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: authController.residentialAddressController,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                ),
              ),
            ),
          ),
          Gap(24.h),
          Text('Area of specialty',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            60.h,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: authController.specialtyController,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                ),
              ),
            ),
          ),
          Gap(24.h),
          Text('Upload CV',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            60.h,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child:Container(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: ()async{

                         await authController.pickCv();
                        },
                        child: Container(
                          width: 126.w,height:49.h,color: AppTheme.grey,child: Center(child: Text('Choose file',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),)),)),

                  Text(authController.cvFile
                  !=null?'${authController.cvFile?.files.single.name}':'',softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10),),
                  ],
                ),
                decoration: BoxDecoration(
                border: Border.all(
                  color:
                    AppTheme.white2
                ),
                  //borderRadius: BorderRadius.circular()
                ),)
            ),
          ),
          Gap(5.h),
          authController
          .load?Indicator2(color: AppTheme.primary
            ,):Padding(
            padding:  const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: ()async{
                print('poll');
                await authController.uploadCv();
              },
              child: Container(
                height:
                33.78.h,
                width:126.w,
                child:  Center(child: Text('Upload file',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),)),
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                      AppTheme.primary
                  ),
                  borderRadius: BorderRadius.circular(9)
                ),),
            ),
          ),
          Gap(24.h),


        ],
      ),
    );
  }
}



class Field4 extends ConsumerWidget {
  const Field4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final authController = ref.watch(authProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [


          Text('Upload medical license',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            60.h,
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child:Container(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            authController
                            .pickMedicalLicense();
                          },
                          child: Container(width: 126.w,height:49.h,color: AppTheme.grey,child: Center(child: Text('Choose file',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),)),)),
                      Text(authController.medicalLicense
                          !=null?'${authController.medicalLicense?.files.single.name}':'',softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10),),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                        AppTheme.white2
                    ),
                    //borderRadius: BorderRadius.circular()
                  ),)
            ),
          ),
          Gap(5.h),
          authController
              .load?Indicator2(color: AppTheme.primary
            ,):Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: ()async{
                await authController.uploadMedicalLicense();
              },
              child: Container(
                height:
                33.78.h,
                width:126.w,
                child:  Center(child: Text('Upload file',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),)),
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                        AppTheme.primary
                    ),
                    borderRadius: BorderRadius.circular(9)
                ),),
            ),
          ),
          Gap(24.h),
          Text('Upload photo',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            60.h,
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child:Container(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            authController
                                .pickImage();
                          },
                          child: Container(width: 126.w,height:49.h,color: AppTheme.grey,child: Center(child: Text('Choose file',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),)),)),
                      Text(authController.imageFile
                          !=null?'${authController.imageFile?.name}':'',softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10),),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                        AppTheme.white2
                    ),
                    //borderRadius: BorderRadius.circular()
                  ),)
            ),
          ),
          Gap(5.h),
          authController
              .load?Indicator2(color: AppTheme.primary
            ,): Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height:
              33.78.h,
              width:126.w,
              child:  GestureDetector(
                  onTap: ()async{

                    await authController.uploadImage();
                  },
                  child: Center(child: Text('Upload file',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),))),
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                      AppTheme.primary
                  ),
                  borderRadius: BorderRadius.circular(9)
              ),),
          ),
          Gap(24.h),
          Text('Write a brief history about yourself',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Gap(8.h),
          SizedBox(
            height:
            92.h,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: authController.historyController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                ),
              ),
            ),
          ),
          Gap(24.h),


        ],
      ),
    );
  }
}

