import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:libonapp/constants/constant.dart';
import 'package:libonapp/view/bottomNav/contacts.dart';
import 'package:libonapp/view/bottomNav/dialpad.dart';
import 'package:libonapp/view/bottomNav/homepage.dart';
import 'package:libonapp/view/bottomNav/profilepage.dart';
import 'package:libonapp/view/bottomNav/sms.dart';
class bottomnav extends StatefulWidget {
  const bottomnav({Key? key}) : super(key: key);

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int index=0;
  List<Widget> elements=[
   homepage(),
    contacts(),
    dialpad(),
    sms(),
    profilepage(),
  ];
  void indextap(indexp){
    setState(() {
      index=indexp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: indextap,
        selectedItemColor: appclr,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(
              index==0?
              'assets/home_active.svg': 'assets/homeUnSelect.svg'),
              label: 'Home'),

          BottomNavigationBarItem(icon: SvgPicture.asset(
              index==1?
              'assets/contacts_active.svg': 'assets/contactsUnSelect.svg'),
              label: 'Contacts'),

          BottomNavigationBarItem(icon: SvgPicture.asset(
              index==2?
              'assets/dial_active.svg': 'assets/dial.svg'),
              label: 'Dial'),

          BottomNavigationBarItem(icon: SvgPicture.asset(
              index==3?
              'assets/sms_active.svg': 'assets/sms.svg'),
              label: 'Sms'),

          BottomNavigationBarItem(icon: SvgPicture.asset(
              index==4?
              'assets/profileActive.svg': 'assets/profile.svg'),
              label: 'Profile'),
        ],

      ),
      body: elements.elementAt(index),

    );
  }
}
