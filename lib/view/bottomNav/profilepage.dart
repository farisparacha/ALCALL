import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libonapp/constants/constant.dart';
import 'package:libonapp/view/auth/phoneandpolicy.dart';
import 'package:libonapp/view/widgets/genericListTile.dart';
class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: appclr,
          shape:const RoundedRectangleBorder(
              borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8))),
          automaticallyImplyLeading: false,
          elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,bottom: 10),
                  child: Text('My Account',
                      style: GoogleFonts.mulish(
                          color: white, fontWeight: FontWeight.w700, fontSize: 18)),
                ),
              )
            )

        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10),
        children: [
          genericListTile(
              title: 'Transfer History',
              ontap: (){}, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/money-send.svg')),
          Divider(),

          genericListTile(
              title: 'Payment Methods',
              ontap: (){}, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/payment.svg')),
          Divider(),

          genericListTile(
              title: 'Billing Address',
              ontap: (){}, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/shop.svg',color: Colors.grey,)),
          Divider(),

          genericListTile(
              title: 'Settings',
              ontap: (){}, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/setting.svg')),
          Divider(),

          genericListTile(
              title: 'Invite Friends',
              ontap: (){}, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/invite.svg')),
          Divider(),

          genericListTile(
              title: 'Aide',
              ontap: (){}, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/aide.svg')),
          Divider(),

          genericListTile(
              title: 'Logout',
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return phoneandpolicy();
                }));
              }, trailing: Icon(Icons.arrow_forward_ios),
              leading: SvgPicture.asset('assets/logout.svg')),
          Divider(),

        ],
      ),
    );
  }
}
