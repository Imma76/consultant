import 'package:consultant/firebase_options.dart';
import 'package:consultant/src/routes/routes.dart';
import 'package:consultant/src/views/home/base.dart';
import 'package:consultant/src/views/patient/patient_history.dart';
import 'package:consultant/src/views/welcome.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
 // DevicePreview(builder: (context)=>
      const MyApp()

  //)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        scaleByHeight: false,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Consultant patient',
            routes:routes,
            builder: DevicePreview.appBuilder,
            initialRoute:WelcomeScreen.id,

            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }

    );
  }
}

