import 'package:flutter/material.dart';
class selectcountry extends StatefulWidget {
  const selectcountry({Key? key}) : super(key: key);

  @override
  State<selectcountry> createState() => _selectcountryState();
}

class _selectcountryState extends State<selectcountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(100),
        child: AppBar(
          shape: RoundedRectangleBorder(borderRadius:
          BorderRadius.only(bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8))),
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(onPressed: (){
            return Navigator.pop(context);
          },icon: Icon(Icons.arrow_back_ios,color: Colors.white)),
          bottom: PreferredSize(preferredSize: Size.fromHeight(140),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Select Country',style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w700,fontSize: 18)),
            ),
          ),

        ),
      ),
    );
  }
}
