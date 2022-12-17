import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libonapp/constants/constant.dart';

import 'conversationDetail.dart';

class sms extends StatefulWidget {
  const sms({Key? key}) : super(key: key);

  @override
  State<sms> createState() => _smsState();
}

class _smsState extends State<sms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: appclr,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            automaticallyImplyLeading: false,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(140),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('SMS',
                    style: GoogleFonts.mulish(
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18)),
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 15,right: 15),
          children: [
            SizedBox(height: 15),
            Text(
              'SMS History',
              style: GoogleFonts.mulish(
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return ChatPage();
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: appclr,
                        child:
                            Text('ES', style: GoogleFonts.mulish(color: white)),
                      ),
                      title: Row(
                        children: [
                          Text('Esther Saphie',
                              style: GoogleFonts.mulish(
                                color: black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                          Card(
                            color: greenContainer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('portable',
                                  style: GoogleFonts.mulish(
                                      color: white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('+225 01 42 36 0912',
                              style:
                                  GoogleFonts.mulish(fontSize: 14, color: Colors.grey)),
                          height4,
                          Text(
                            'hey esther,come to the apartment',
                            style: GoogleFonts.mulish(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      trailing: Text(
                        '1hr ago',
                        style: GoogleFonts.mulish(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 15),
                      child: Divider(),
                    )
                  ],
                );
              },
            ),
            Text(
              'Support History',
              style: GoogleFonts.mulish(
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    height10,
                    ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return ChatPage();
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: appclr,
                        child:
                        Text('ES', style: GoogleFonts.mulish(color: white)),
                      ),
                      title: Row(
                        children: [
                          Text('Esther Saphie',
                              style: GoogleFonts.mulish(
                                color: black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                          Card(
                            color: greenContainer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('Support',
                                  style: GoogleFonts.mulish(
                                      color: white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('+225 01 42 36 0912',
                              style:
                              GoogleFonts.mulish(fontSize: 14, color: Colors.grey)),
                          height4,
                          Text(
                            'hey esther,come to the apartment',
                            style: GoogleFonts.mulish(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      trailing: Text(
                        '1hr ago',
                        style: GoogleFonts.mulish(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 15),
                      child: Divider(),
                    )
                  ],
                );
              },
            ),
          ],
        ));
  }
}
