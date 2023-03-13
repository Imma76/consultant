import 'package:bot_toast/bot_toast.dart';
import 'package:consultant/firebase_options.dart';
import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/routes/routes.dart';
import 'package:consultant/src/utils/widgets/loader.dart';
import 'package:consultant/src/views/home/base.dart';
import 'package:consultant/src/views/home/home_page.dart';
import 'package:consultant/src/views/patient/patient_history.dart';
import 'package:consultant/src/views/welcome.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
final botToastBuilder = BotToastInit();
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
          return ProviderScope(
            child: MaterialApp(
              navigatorKey: navigatorKey,
              title: 'Consultant patient',
              routes:routes,
             // builder: DevicePreview.appBuilder,
              //initialRoute:WelcomeScreen.id,
              navigatorObservers: [BotToastNavigatorObserver()],
              builder: BotToastInit(),
              home: LoadApp(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        }

    );
  }
}


class LoadApp extends ConsumerStatefulWidget {
  const LoadApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoadAppState();
}

class _LoadAppState extends ConsumerState<LoadApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(centralProvider).initializeApp();


  }
  @override
  Widget build(BuildContext context) {
    final centralController = ref.watch(centralProvider);
    if(centralController.isAppLoading){

      return Scaffold(body:Indicator());
    }
    if(centralController.isUserPresent){

      return Base();
    }

    return WelcomeScreen();

  }
}



