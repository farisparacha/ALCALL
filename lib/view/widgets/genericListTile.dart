import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class genericListTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final Icon trailing;
  final VoidCallback ontap;
  const genericListTile({Key? key,
  required this.title,required this.ontap,required this.trailing,
    required this.leading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(title,style: GoogleFonts.mulish(

      ),),
      leading: leading,
      trailing: trailing,
      onTap: ontap,
    );
  }
}
