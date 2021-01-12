import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'screens/home/home.dart';
import 'screens/records/records.dart';
import 'screens/user/user.dart';
import 'screens/prefs/prefs.dart';

void main() async {
  runApp(MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        showPerformanceOverlay: false,
        title: 'div.is',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => HomePage(),
          "Records": (BuildContext context) => RecordsListPage(records: [], onTapped: (record) {}),
          "User": (BuildContext context) => UserPage(),
          "Prefs": (BuildContext context) => PrefsPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.ibmPlexSansTextTheme(
            Theme.of(context).textTheme,
          ).apply(bodyColor: Colors.white),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurpleAccent
          ),
          appBarTheme: AppBarTheme(
            elevation: 4.0,
            centerTitle: true,
            color: Colors.white,
            textTheme: GoogleFonts.ibmPlexSansTextTheme(
              Theme.of(context).textTheme).apply(bodyColor: Colors.white),
          ),
          fontFamily: "IBM Plex Sans",
          primarySwatch: Colors.deepPurple,
          colorScheme: const ColorScheme.dark(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        home: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey("Home"),
              child: HomePage(
                key: ValueKey("Home"),
                title: "Home",
              ),
            ),
            // MaterialPage(
            //   child: RecordsPage(key: ValueKey("Records"), title: "Records"),
            // )
          ],
          onPopPage: (route, res) => route.didPop(res),
        )
        // home: MyHomePage(title: 'div.is'),
        );
  }
}
