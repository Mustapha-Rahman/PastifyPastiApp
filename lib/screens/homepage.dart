import 'package:flutter/material.dart';

import '../services/firebase services.dart';
import '../tabs/hometab.dart';
import '../tabs/savedtab.dart';
import '../tabs/searchtabs.dart';
import '../widget/buttom tabs.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  late PageController _tabsPageController;
  int _selectedTab =0;


  @override
  void initState() {
  _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });

              },
              children: [
                HomeTab(),

                SearchTab(),

                SavedTab(),
              ],

            ),
          ),

         ButtomTab(
           selectedTab: _selectedTab,
           tabPressed: (num ) {
             setState(() {
               _tabsPageController.animateToPage(
                   num,
                   duration: Duration(milliseconds: 300),
                   curve: Curves.easeOutCubic
               );
             });
         },
         ),
        ],
      ),
    );
  }
}


