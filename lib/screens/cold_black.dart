import 'package:coffe_shop_ui/constants/consts.dart';
import 'package:coffe_shop_ui/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackGold extends StatefulWidget {
  const BlackGold({Key? key}) : super(key: key);

  @override
  _BlackGoldState createState() => _BlackGoldState();
}

class _BlackGoldState extends State<BlackGold> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItem('images/coffee4.png', '150', ConstColor.secondSlice),
        buildListItem('images/coffee2.png', '250', ConstColor.firstSlice),
      ],
    );
  }

  buildListItem(String imgPath, String price, Color bgColor) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CoffeeDetails(imgPath: imgPath, headerColor: bgColor)
        ));
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,

            ),
          ),
          Positioned(
            top: 100,
            width: 250,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(.6),
              ),
            ),),Positioned(
            top: 100,
            width: 250,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: bgColor.withOpacity(.9),

              ),
            ),),
          Positioned(

            right: 2,
            child: Hero(
              tag: imgPath,
              child: Container(

                height: 250,
                width: 150,
                child: Image.asset(imgPath,fit: BoxFit.scaleDown,),

              ),
            ),
          ),
          Positioned(
              top: 125.0,
              left: 15.0,
              child: Column(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.bigShouldersText(
                          color: Color(0xFF23163D), fontSize: 20.0),
                    ),
                    Text(
                      '\$' + price,
                      style: GoogleFonts.bigShouldersText(
                          color: Colors.white, fontSize: 40.0),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Grady\'s COLD BREW',
                      style: GoogleFonts.bigShouldersText(
                          color: Color(0xFF23163D), fontSize: 27.0),
                    ),
                    SizedBox(height: 2.0),
                    Container(
                        width: 200.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '65 reviews',
                                      style: GoogleFonts.bigShouldersText(
                                          color: Colors.white, fontSize: 15.0),
                                    ),

                                  ]
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: 75.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.0),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add, size: 17.0),
                                            SizedBox(width: 5.0),
                                            Text('Add',
                                              style: GoogleFonts.bigShouldersText(
                                                  color: Color(0xFF23163D), fontSize: 15.0),
                                            )
                                          ]
                                      )
                                  )
                              )
                            ]
                        )
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}
