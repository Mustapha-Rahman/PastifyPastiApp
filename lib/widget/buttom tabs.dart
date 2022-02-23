import 'package:flutter/material.dart';

class ButtomTab extends StatefulWidget {

  final int selectedTab;
  final  Function(int) tabPressed;
  ButtomTab({  required this.selectedTab, required this.tabPressed});


  @override
  State<ButtomTab> createState() => _ButtomTabState();
}

class _ButtomTabState extends State<ButtomTab> {

  int _selectedTab = 0;





  @override
  Widget build(BuildContext context) {

      _selectedTab =widget.selectedTab;


    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0)
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ]
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtomTabBtn(imagePath: 'assets/images/tab home.png',
            selected: _selectedTab== 0 ? true :false,
            onPressed: (){
              widget.tabPressed(0);
            },
          ),

          ButtomTabBtn(imagePath: 'assets/images/tab search.png',
            selected: _selectedTab == 1 ? true :false,
            onPressed: (){
              widget.tabPressed(1);
               },),

          ButtomTabBtn(imagePath: 'assets/images/tab saved.png',
            selected: _selectedTab == 2 ? true :false,  onPressed: (){
              widget.tabPressed(2);
            },),



        ],
      ),
    );
  }
}



class ButtomTabBtn extends StatelessWidget {
  final   String imagePath;
  final   bool selected;
  final  onPressed;
  ButtomTabBtn({ required this.imagePath, required this.selected, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    bool _selected = selected;


    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _selected ?Colors.red: Colors.transparent,
              width: 2.0,

            )
          )
        ),
        child: Image(
          image: AssetImage(
              imagePath
          ),
          width: 22.0,
          height: 22.0,

        ),
      ),
    );
  }
}

