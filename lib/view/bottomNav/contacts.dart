import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libonapp/constants/constant.dart';
import 'package:libonapp/view/bottomNav/homepage.dart';
class contacts extends StatefulWidget {
  const contacts({Key? key}) : super(key: key);

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  List<Contact> _contacts=[];
  List<Contact> copiedcontacts=[];
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
    items.addAll(_contacts);
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  TextEditingController editingController = TextEditingController();

  List items =[];

  void _runFilter(String enteredKeyword) async {
    List<Contact> results = [];
    if (enteredKeyword.isEmpty) {
      results = await _contacts;
    } else {
      results = await _contacts
          .where((searchContacts) =>
          searchContacts.displayName.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      copiedcontacts = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          backgroundColor: appclr,
          shape:const RoundedRectangleBorder(
              borderRadius:
          BorderRadius.only(
              bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8))),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text('Contacts',
              style: GoogleFonts.mulish(color: white)),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(110),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: editingController,
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                      hintText: 'Search Contacts',
                prefixIcon: Icon(Icons.search_rounded),
                fillColor: white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: appclr)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: white)),
                    enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: white)) ),
                ),
              )),

        ),
      ),
      body: _body()
    );

  }
  String id = '';
  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: copiedcontacts.isEmpty?_contacts.length:copiedcontacts.length,
        itemBuilder: (context, i) {
          id = _contacts[i].id;
          return Column(
            children: [
              ListTile(
                  leading: CircleAvatar(
                    backgroundColor: appclr,
                    child: Text(
                      copiedcontacts.isEmpty?
                      _contacts[i].displayName.substring(0,1):
                      copiedcontacts[i].displayName.substring(0,1),
                    style: GoogleFonts.mulish(
                      color: white
                    ),
                    ),
                  ),
                  title: Text(
                    copiedcontacts.isEmpty?
                    _contacts[i].displayName:
                    copiedcontacts[i].displayName,
                    style: GoogleFonts.mulish(
                  ),),
                  onTap: () async {
                    final fullContact =
                    await FlutterContacts.getContact(_contacts[i].id);
                    //await Navigator.of(context).push(
                     //   MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
                    _settingModalBottomSheet(
                       context,
                       copiedcontacts.isEmpty?
                       _contacts[i].displayName:
                       copiedcontacts[i].displayName,
                       copiedcontacts.isEmpty?
                        _contacts[i].displayName.substring(0,2):
                       copiedcontacts[i].displayName.substring(0,2),
                       fullContact!.phones.first.number);
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 15),
                child: Divider(),
              )
            ],
          );
        });
  }
  
  
  
   _settingModalBottomSheet(context,name,firstletname,number){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              borderRadius: borderRadius12
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: borderRadius12
                    ),
                  ),
                  height20,
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      firstletname,
                  style: GoogleFonts.mulish(color: white),
                  ),backgroundColor: appclr,),
                  height10,
                  Text(name,
                    style: GoogleFonts.mulish(color: black),
                  ),
                  height10,
                  Text(number,
                    style: GoogleFonts.mulish(color: black),
                  ),
                  height16,
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Icon(Icons.local_phone_rounded,color: white),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Color(0xff15D1AF)),),
                    ),
                    width10,
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed:()async{
                          final fullContact =
                          await FlutterContacts.getContact(id);

                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
                        },
                        child: Icon(Icons.arrow_forward,color: white),
                        style: ElevatedButton.styleFrom(shape:
                        CircleBorder(),backgroundColor:appclr),),
                    ),
                  ],)
                ],
              ),
            ),
          );
        }
    );
  }
}
class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          backgroundColor: bckground,
      appBar: AppBar(
        backgroundColor: bckground,
        elevation: 0,
        leading:   IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: black,)),
      ),
      body: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: appclr,
              child: Text(contact.name.first.substring(0,2),
              style: GoogleFonts.mulish(
                color: white
              ),
              ),
            ),
        height10,
        Text(contact.name.first+' '+contact.name.last,
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.bold
        ),
        ),
      height10,
      ListTile(
        leading: SvgPicture.asset('assets/ireland.svg',color: appclr,),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'),
            Card(
              color: greenContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text('portable',
                    style: GoogleFonts.mulish(
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
        trailing:  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              child: ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.local_phone_rounded,color: white),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xff15D1AF)),),
            ),
            width10,
            Container(
              height: 40,
              child: ElevatedButton(
                onPressed:()async{
                },
                child: Icon(Icons.arrow_forward,color: white),
                style: ElevatedButton.styleFrom(shape:
                CircleBorder(),backgroundColor:appclr),),
            ),
          ],)
      ),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child: Divider(),
            )
      ]));
}

