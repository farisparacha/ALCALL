import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libonapp/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
class dialpad extends StatefulWidget {
  const dialpad({Key? key}) : super(key: key);

  @override
  State<dialpad> createState() => _dialpadState();
}

class _dialpadState extends State<dialpad> {
  String countryCode = '';
  String? countryname;
  String countryflag = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: appclr,
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8))),
          automaticallyImplyLeading: false,
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                            onPressed: (){
                          showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              backgroundColor: white,
                              textStyle:  GoogleFonts.mulish(
                                  fontSize: 16, color: Colors.blueGrey),
                              bottomSheetHeight: 500,

                              borderRadius:const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              print('Select country: $countryname');
                              setState(() {
                                countryname = country.name;
                                countryCode=country.countryCode;
                                countryflag = country.flagEmoji;
                              });
                            },
                          );
                        }, icon: Icon(Icons.arrow_drop_down_sharp,color: white,),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appclr,
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none),
                            elevation: 0),
                        label: countryname==null||countryflag==null?
                        Text('Select country'):Text(countryflag+' '+countryname!),
                        ),
                      ],
                    ),
                  ],
                ),
              )),

        ),
      ),
        body: SafeArea(
          child: DialPad(
              backspaceButtonIconColor: black,
              makeCall: (number)async{
                print(number);
              await FlutterPhoneDirectCaller.callNumber(number);
              },

          ),
        )
    );
  }
}
