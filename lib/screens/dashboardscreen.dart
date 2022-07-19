import 'package:coffe_shop_ui/constants/consts.dart';
import 'package:coffe_shop_ui/screens/cold_black.dart';
import 'package:coffe_shop_ui/screens/cold_brew.dart';
import 'package:coffe_shop_ui/screens/gold_brew.dart';
import 'package:coffe_shop_ui/screens/mccafe.dart';
import 'package:coffe_shop_ui/screens/nescafe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var _selectedOption = 0;
  List<Widget> allOptions = [
    BlackGold(),
    ColdBrew(),
    Nescafe(),
    McCafe(),
    GoldBrew(),
  ];
  List isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: Colors.transparent,
          ),
          Container(
            height: screenHeight,
            width: screenWidth / 5,
            color: ConstColor.lefBarColor,
          ),
          Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              color: Colors.white,
              width: screenHeight - (screenWidth / 5),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 35,
            child: Icon(Icons.menu),
          ),
          Positioned(
            right: 20.0,
            top: 35,
            child: Icon(Icons.shopping_bag_outlined),
          ),
          Positioned(
            top: screenHeight - (screenHeight - 100),
            left: (screenWidth / 5) + 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Coffee House",
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 40),
                ),
                Text(
                  "A lot can happen over coffee",
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59FB0), fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 225,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.4),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                      hintText: 'search..',
                      hintStyle: GoogleFonts.bigShouldersText(
                          color: Color(0xFFA59FB0), fontSize: 15),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          buildSideNavigator(),
          Positioned(
            top: (screenHeight / 3) + 5,
            left: (screenWidth / 5) + 25,
            child: Container(
                height: screenHeight -((screenHeight/3)+50),
                width: screenWidth -((screenWidth/5)+40),
                child: allOptions[_selectedOption]),
          )
        ],
      ),
    );
  }

  buildSideNavigator() {
    return Positioned(
      top: 75,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.height - 100),
          height: MediaQuery.of(context).size.width / 5,
          width: MediaQuery.of(context).size.height - 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOption('Black Gold', 0),
              buildOption('Cold Brew', 1),
              buildOption('Nescafe', 2),
              buildOption('McCafe', 3),
              buildOption('Gold Brew', 4),
            ],
          ),
        ),
      ),
    );
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF23163D),
                ),
              )
            : Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = index;
              isOptionSelected(index);
            });
          },
          child: Text(
            title,
            style: GoogleFonts.bigShouldersText(
                color:
                    isSelected[index] ? Color(0xFF23163D) : Color(0xFFA59FB0),
                fontSize: isSelected[index] ? 18 : 17),
          ),
        ),
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
