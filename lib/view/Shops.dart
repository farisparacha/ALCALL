import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constant.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  State<Shops> createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  String? countryname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Shop',style: GoogleFonts.mulish(),),
          backgroundColor: appclr,
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          automaticallyImplyLeading: false,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Image.asset('assets/card.png'),
            )
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10),
        children: [
        TextFormField(
          keyboardType: TextInputType.none,
          onChanged: (v){
            setState(() {
              countryname=v;
            });
          },
          cursorColor: appclr,
          showCursor: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: white,
            hintText: countryname,
            prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,),
            suffixIcon: Icon(Icons.arrow_drop_down_rounded, color: Colors.grey,),
            border: OutlineInputBorder(
              borderRadius: borderRadius12,
              borderSide: BorderSide(
                width: 0.5,
                color: Colors.grey
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius12,
                borderSide: BorderSide(
                    width: 0.5,
                    color: Colors.grey
                )
            ),
          ),
          onTap: (){
            showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: 25,
                backgroundColor: white,
                textStyle:  GoogleFonts.mulish(
                    fontSize: 16, color: Colors.blueGrey),
                borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              showPhoneCode: false,
              onSelect: (Country country) {
              setState(() {
                countryname = country.displayName;
              });
              },
            );
          },
        ),
          height20,
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffEE1C25),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/chinaflag.png'),
              ),
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mainland China',style: GoogleFonts.mulish(
                    color: black,
                    fontWeight: FontWeight.w600
                  ),),
                  height6,
                  Text('From 11 F CFA/min',style: GoogleFonts.mulish(
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
          ),

          height20,
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff469B65),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/ire.png'),
              ),
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ivory Coast',style: GoogleFonts.mulish(
                      color: black,
                      fontWeight: FontWeight.w600
                  ),),
                  height6,
                  Text('From 47 F CFA/min',style: GoogleFonts.mulish(
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
