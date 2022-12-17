import 'package:flutter/material.dart';
import 'package:libonapp/view/auth/phoneandpolicy.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constant.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Star1.png'),
                width20,width20,
                Padding(padding: EdgeInsets.only(top: 20),
                child: Image.asset('assets/Star2.png'),
                )
              ],
            ),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(padding: EdgeInsets.only(bottom: 50),
              child:   Image.asset('assets/Star3.png'),
              ),
                width20,
                Image.asset('assets/Star4.png'),
              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Image.asset('assets/Star5.png'),
                )),
            Spacer(),
            Text("let's get start",
              style: GoogleFonts.mulish(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: black
              ),
            ),
            IconButton(
                color: appclr,
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return phoneandpolicy();
              },));

            },
                icon: Icon(Icons.arrow_circle_right_rounded,size: 56,)),
            height20,height20,
          ],
        ),
      ),
    );
  }
}

