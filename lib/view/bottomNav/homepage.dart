import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libonapp/constants/constant.dart';
import 'package:libonapp/view/Shops.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(

          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 170,
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          index == 0
                              ? Text(
                            'Last Call History',
                            style: GoogleFonts.mulish(
                                color: black,
                                fontWeight: FontWeight.w700,
                                fontSize: 24),
                          )
                              : Container(),
                         height10,
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: appclr,
                              child: Text('ES', style: GoogleFonts.mulish(color: white)),
                            ),
                            title: Row(
                              children: [
                                Text('Esther Saphie',
                                    style: GoogleFonts.mulish(
                                      color: black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    )),
                                Container(
                                  height: 30,
                                  width: 70,
                                  child: Card(
                                    color: greenContainer,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    elevation: 0,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 4,top: 2),
                                      child: Text('portable',
                                          style: GoogleFonts.mulish(
                                              color: white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Text(
                              '+225 01 42 36 0912',
                              style: GoogleFonts.mulish(fontSize: 14, color: Colors.grey),
                            ),
                            trailing: Text(
                              '0 sec',
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
                  )),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 1.2 + shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 1.5,
      child: Stack(
        children: [
          SizedBox(
            height: 180,
            child: AppBar(
              backgroundColor: appclr,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 2,
              leadingWidth: 150,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: white,
                          size: 40,
                        )),
                    height10,
                    Text("\$456,893.03USD",
                        style: GoogleFonts.mulish(
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)),
                    height6,
                    Text('Current Balance',
                        style: GoogleFonts.mulish(color: white)),
                    height20,height20
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Shop', style: GoogleFonts.mulish(color: white)),
                    width8,
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return Shops();
                        }));
                      },
                      child: SvgPicture.asset('assets/shop.svg'),
                    ),
                    width10,
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * percent),
                child: Card(
                  shape: roundedRectangleBorder12,
                  elevation: 0,
                  child: Center(
                    child: ListTile(
                      title: Text('Buy Credit',style: GoogleFonts.mulish(
                        color: black,
                        fontWeight: FontWeight.w600
                      ),),
                      subtitle: Text('add credit account information & buy credit'),
                      trailing: IconButton(
                          color: appclr,
                          onPressed: (){},
                          icon: Icon(Icons.arrow_circle_right_rounded,size: 35,)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}



/*class ab extends StatelessWidget {
  const ab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: AppBar(
          backgroundColor: appclr,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          leadingWidth: 150,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: white,
                      size: 40,
                    )),
                height10,
                Text("\$456,893.03USD",
                    style: GoogleFonts.mulish(
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
                height6,
                Text('Current Balance',
                    style: GoogleFonts.mulish(color: white)),
                height6,
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Shop', style: GoogleFonts.mulish(color: white)),
                width8,
                SvgPicture.asset('assets/shop.svg'),
                width10,
              ],
            )
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  index == 0
                      ? Text(
                          'Last Call History',
                          style: GoogleFonts.mulish(
                              color: black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        )
                      : Container(),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text('ES', style: GoogleFonts.mulish(color: white)),
                    ),
                    title: Row(
                      children: [
                        Text('Esther Saphie',
                            style: GoogleFonts.mulish(
                              color: black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )),
                        Container(
                          height: 25,
                          width: 55,
                          child: Card(
                            color: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            elevation: 0,
                            child: Text('portable',
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )
                      ],
                    ),
                    subtitle: Text(
                      '+225 01 42 36 0912',
                      style: GoogleFonts.mulish(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Text(
                      '0 sec',
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
          )),
    );
  }
}*/
