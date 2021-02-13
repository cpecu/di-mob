import 'package:dimo/page/records/records.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/comp/sheet.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/comp/input.dart';
import 'package:dimo/comp/fab.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import 'package:dimo/models/record/record.dart';
import 'package:dimo/util.dart';
import '../records/record_router.dart';

class HomePage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomePage(),
  );
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  static String routeName = "Home";


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  RecordRouterDelegate _routerDelegate = RecordRouterDelegate();
  TabController controller;

  int _index = 0;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomBar = DlBottomBar(key: Key("bottomBar"), restorationId: "bottom_bar", type: BottomBarKind.Labels);
    final dlDrawer = DlDrawer(key: Key("drawer"));
    final dlAppBar = DlAppBar(key: Key("appBar"), title: "div.is");

    return Scaffold(
      primary: true,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: dlDrawer,
      appBar: DlAppBar(key: Key("appBar"), title: "devisa").bar(context),
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   centerTitle: true,
      //   elevation: 10.0,
      //   title: Row(children: [
      //     Text("devisa", style: TextStyle(color: Colors.white, fontSize: 21.0),),
      //   ],
      //     mainAxisAlignment: MainAxisAlignment.center,
      //   ),
      //   backgroundColor: Colors.deepPurpleAccent,
      //   actions: [
      //     // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
      //     IconButton(
      //       icon: Icon(Icons.my_library_add_rounded),
      //       onPressed: () => DlListSheet().show(context),
      //     ),
      //   ],
      // ),
      body: body(context),
      // body: SingleChildScrollView(
      //   child: SafeArea(
      //     child: Container(
      //       padding: EdgeInsets.symmetric(horizontal: 16.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           SizedBox(
      //             height: 20.0,
      //           ),
      //           RichText(
      //             text: TextSpan(
      //               children: [
      //                 TextSpan(
      //                   text: "Home",
      //                   style: TextStyle(
      //                     fontSize: 22.0,
      //                     height: 1.3,
      //                     fontWeight: FontWeight.w300,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),],),),),),
      bottomNavigationBar: DlBottomBar(restorationId: "", key: Key(""), type: BottomBarKind.Labels),
      endDrawerEnableOpenDragGesture: true,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: DlFab(sheet: DlSheet()),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff1a181f),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 20, 16),
              child: Column(
                children: [
                  sectionHeader("Dashboard", Icons.dashboard_rounded),
                  SizedBox(height: 15),
                  section(),
                  Ink(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 35,
                          ),
                          Text("Home")
                        ],
                      ),
                    ),
                  ),
                  sectionHeader("Records", Icons.book_online_rounded),
                  section(),
                  sectionHeader("Items", Icons.book_online_rounded),
                  section(),
                  sectionHeader("Stats", Icons.book_online_rounded),
                  section(),
                  sectionHeader("Profile", Icons.book_online_rounded),
                  section(),
                  sectionHeader("Facts", Icons.book_online_rounded),
                  section(),
                ],
              )
              )
          )
        )
    );
  }

  void _newFact(BuildContext context) {
    showAboutDialog(context: context);
  }

  void _viewRecords(BuildContext context) {
    showModal(context: context, builder: (BuildContext context) {
      return Column(
        children: [
          Text("Hello!"),
          MaterialButton(onPressed: () {}),
        ],
       );
    });
  }

  Widget sectionHeader(String title, IconData icon) {

    return Container(
      // width: 100,
      height: 100,
      decoration: BoxDecoration(
        // color: Color(0xff3a383f),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.fromLTRB(30, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 32),
          Divider(indent: 20),
          Text(title, style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white)),
        ]
      )
    );
  }

  Widget section() {
    return Column(
      children: [],
    );

  }

}
