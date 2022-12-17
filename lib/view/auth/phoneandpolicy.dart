import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_multi_formatter/widgets/country_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libonapp/constants/constant.dart';
import 'package:libonapp/view/auth/OTP.dart';
import 'package:libonapp/view/auth/PrivacyPolicy.dart';
import 'package:libonapp/view/auth/termsAndConditions.dart';

class phoneandpolicy extends StatefulWidget {
  const phoneandpolicy({Key? key}) : super(key: key);

  @override
  State<phoneandpolicy> createState() => _phoneandpolicyState();
}

class _phoneandpolicyState extends State<phoneandpolicy> {
  PhoneCountryData? _initialCountryData;
  String countryCode = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bckground,
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: bckground,
        elevation: 0,
        title: Text('Phone Number & Policy',style:
        GoogleFonts.mulish(color: black,fontWeight: FontWeight.w600,)),
        leading: IconButton(
            onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios, color: black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CountryDropdown(
                    printCountryName: true,
                    dropdownColor: bckground,
                    icon: Icon(Icons.arrow_drop_down_rounded),
                    initialCountryCode: 'PK',
                    onCountrySelected: (
                        PhoneCountryData countryData) {
                      setState(() {
                        _initialCountryData = countryData;
                      });
                    },
                  ),
                ),
                width10,
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    key: ValueKey(_initialCountryData ?? 'country'),
                    decoration: InputDecoration(
                      hintText: _initialCountryData?.phoneMaskWithoutCountryCode,
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      PhoneInputFormatter(
                        allowEndlessPhone: false,
                        defaultCountryCode: _initialCountryData?.countryCode,
                      )
                    ],
                  ),
                )
              ],
            ),
            height20,height10,
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return OTP();
                },));
              }, child: Text('Continue',
                style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  shape: roundedRectangleBorder12,
                backgroundColor: appclr,
                foregroundColor: white
              ),),
            ),
            height20,height20,height20,
            RichText(text:
            TextSpan(style:
                TextStyle(
                  fontSize: 16,
                    color: black
                ),
              text: 'By continuing, you agree to our ',
              children: [
                TextSpan(
                    text: 'Terms & Conditions ',
                   style: TextStyle(
                        color: appclr
                    ),
                recognizer: TapGestureRecognizer()..onTap=(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)
                      {
                        return TermsAndConditions();
                      }));
                }),
                TextSpan(text: 'and acknowledge that you have read our ',
                  style: TextStyle(
                      color: black
                  ),
                ),
                TextSpan(text: 'Privacy Policy ',
                    style: TextStyle(
                        color: appclr
                    ),
                recognizer: TapGestureRecognizer()..onTap=(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return PrivacyPolicy();
                  }));
                }),
                TextSpan(text: 'to learn how we collect, use and share your data.',
                  style: TextStyle(
                      color: black
                  ),
                ),

              ]

            )),
            height20,
          ],
        ),
      ),

    );
  }
}
