// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:libonapp/constants/constant.dart';
//
// class ConversationDetail extends StatefulWidget {
//   const ConversationDetail({Key? key}) : super(key: key);
//
//   @override
//   State<ConversationDetail> createState() => _ConversationDetailState();
// }
//
// class _ConversationDetailState extends State<ConversationDetail> {
//   final TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(12),
//               bottomLeft: Radius.circular(12)
//             )
//           ),
//           elevation: 0,
//           backgroundColor: appclr,
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(120),
//             child: ListTile(
//               leading: IconButton(onPressed: (){
//                 Navigator.pop(context);
//               },
//                   icon: Icon(Icons.arrow_back_ios,color: white,)),
//               title: Text('Contact with Support Team',
//               style: GoogleFonts.mulish(
//                 color: white
//               ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: bckground,
//       body: Stack(
//         children: [
//           Positioned(
//             bottom: 10,
//             right: 5,
//             left: 5,
//             child:   TextFormField(
//               controller: controller,
//               //onChanged: (value) => _runFilter(value),
//               decoration: InputDecoration(
//                   prefixIconConstraints: BoxConstraints(
//                     minWidth: 0,
//                     minHeight: 0,
//                   ),
//                   isDense: true,
//                   suffixIconConstraints: BoxConstraints(
//                     minWidth: 50,
//                     minHeight: 2,
//                   ),
//                   hintText: 'Type a message',
//                   fillColor: white,
//                   filled: true,
//                   suffixIcon: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       IconButton(onPressed: (){},
//                           icon:SvgPicture.asset('assets/attach.svg')),
//                       IconButton(onPressed: (){},
//                           icon:SvgPicture.asset('assets/Camera.svg',color: black,)),
//                       GestureDetector(
//                         onTap: (){},
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 8.0,bottom: 2),
//                           child: Card(
//                             color: appclr,
//                             child: Image.asset('assets/send.png'),
//                           ),
//                         )
//                       ),
//
//                     ],
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: appclr)),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Color(0xff9D9EA7))),
//                   enabledBorder:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Color(0xff9D9EA7))) ),
//             ),),
//           Positioned(
//             top: 4,
//             child: Column(
//               children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: appclr,
//                     child: Text('A',style: GoogleFonts.mulish(
//                       color: white
//                     ),),
//                   ),
//                   Card(
//                       shape:const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(15),
//                               topLeft: Radius.circular(15),
//                               bottomRight: Radius.circular(15)
//                           ) ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text('hello this is testing\n'),
//                       )),
//                 ],
//               ),
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: Text('10:43 am')),
//               ],
//             ),
//           ),
//
//           Positioned(
//             top: 4,
//             right: 5,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: appclr,
//                       child: Text('A',style: GoogleFonts.mulish(
//                           color: white
//                       ),),
//                     ),
//                     Card(
//                         shape:const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(15),
//                                 topLeft: Radius.circular(15),
//                                 bottomRight: Radius.circular(15)
//                             ) ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('hello this is testing\n'),
//                         )),
//                   ],
//                 ),
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: Text('10:43 am')),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }




import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants/constant.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final TextEditingController controller = TextEditingController();
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12)
            )
          ),
          elevation: 0,
          backgroundColor: appclr,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: ListTile(
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                  icon: Icon(Icons.arrow_back_ios,color: white,)),
              title: Text('Contact with Support Team',
              style: GoogleFonts.mulish(
                color: white
              ),
              ),
            ),
          ),
        ),
      ),

      body: Chat(
        customBottomWidget:
        Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: TextFormField(
                controller: controller,
                //onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    isDense: true,
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 2,
                    ),
                    hintText: 'Type a message',
                    fillColor: white,
                    filled: true,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(onPressed: _handleAttachmentPressed,
                            icon:SvgPicture.asset('assets/attach.svg')),
                        IconButton(onPressed:_handleImageSelection,
                            icon:SvgPicture.asset('assets/Camera.svg',color: black,)),
                        GestureDetector(
                          onTap: ()async{
                            await _handlePreviewDataFetched;
                            await _handleSendPressed;
                            await _handleMessageTap;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0,bottom: 2),
                            child: Card(
                              color: appclr,
                              child: Image.asset('assets/send.png'),
                            ),
                          )
                        ),

                      ],
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: appclr)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff9D9EA7))),
                    enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff9D9EA7))) ),
              ),
        ),

        theme:  DefaultChatTheme(
          inputContainerDecoration: BoxDecoration(
          ),
          inputTextCursorColor:appclr,
          userAvatarNameColors: [appclr,greenContainer],
          systemMessageTheme: SystemMessageTheme(
              textStyle: GoogleFonts.mulish(),
              margin: EdgeInsets.all(4)
          ),
          unreadHeaderTheme: UnreadHeaderTheme(
              textStyle: GoogleFonts.mulish(),
              color: appclr
          ),
          receivedMessageDocumentIconColor: Colors.grey,
          secondaryColor: greenContainer,
          attachmentButtonIcon:SvgPicture.asset('assets/attach.svg',height: 100,) ,
          seenIcon: Icon(
              Icons.check),
              sendButtonIcon: Image.asset('assets/abc.png'),
          sendingIcon: Icon(Icons.access_time_rounded),
          sentMessageDocumentIconColor: appclr,
          messageInsetsVertical: 5,
          statusIconPadding: EdgeInsets.all(10),
          userAvatarImageBackgroundColor: appclr,
          primaryColor: appclr,
          receivedEmojiMessageTextStyle: GoogleFonts.mulish(),
          receivedMessageBodyTextStyle: GoogleFonts.mulish(),
          receivedMessageCaptionTextStyle: GoogleFonts.mulish(),
          receivedMessageLinkDescriptionTextStyle: GoogleFonts.mulish(),
          receivedMessageLinkTitleTextStyle: GoogleFonts.mulish(),
          sentEmojiMessageTextStyle: GoogleFonts.mulish(),
          sentMessageBodyTextStyle: GoogleFonts.mulish(),
          sentMessageCaptionTextStyle: GoogleFonts.mulish(),
          sentMessageLinkDescriptionTextStyle: GoogleFonts.mulish(),
          sentMessageLinkTitleTextStyle: GoogleFonts.mulish(),
          userAvatarTextStyle: GoogleFonts.mulish(),
          userNameTextStyle: GoogleFonts.mulish(),
          receivedMessageBodyBoldTextStyle: GoogleFonts.mulish(),
          receivedMessageBodyCodeTextStyle: GoogleFonts.mulish(),
          receivedMessageBodyLinkTextStyle: GoogleFonts.mulish(),
          sentMessageBodyBoldTextStyle: GoogleFonts.mulish(),
          sentMessageBodyCodeTextStyle: GoogleFonts.mulish(),
          sentMessageBodyLinkTextStyle: GoogleFonts.mulish(),
          attachmentButtonMargin: EdgeInsets.all(8),
          dateDividerMargin: EdgeInsets.all(5),
          dateDividerTextStyle: GoogleFonts.mulish(),
          deliveredIcon: Icon(Icons.delivery_dining),
          documentIcon: Icon(Icons.document_scanner),
          emptyChatPlaceholderTextStyle: GoogleFonts.mulish(),
          errorColor: Colors.red,
          errorIcon: Icon(Icons.error),
          inputBackgroundColor: white,
          inputBorderRadius: BorderRadius.circular(12),
          inputMargin: EdgeInsets.only(bottom: 10),
          inputPadding: EdgeInsets.all(5),
          inputTextColor: black,
          inputTextDecoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: appclr)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xff9D9EA7))),
                  enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xff9D9EA7))),
          ),
          inputTextStyle: GoogleFonts.mulish(),
          messageBorderRadius: 12,
          messageInsetsHorizontal: 5,

          backgroundColor: white
      ),
      messages: _messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true,
      user: _user,
        imageGalleryOptions: ImageGalleryOptions(
        ),

    ),
  );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: black,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: Image.asset('assets/gallery.png'),
              ),
              // TextButton(
              //
              //   child:  Align(
              //     alignment: AlignmentDirectional.centerStart,
              //     child: Text('Photo',style: GoogleFonts.mulish(
              //       color: appclr
              //     ),),
              //   ),
              // ),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: Image.asset('assets/camera.png'),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: Image.asset('assets/file.png'),
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //     _handleFileSelection();
              //   },
              //   child:  Align(
              //     alignment: AlignmentDirectional.centerStart,
              //     child: Text('File',style: GoogleFonts.mulish(
              //         color: appclr
              //     ),),
              //   ),
              // ),

        Padding(padding: EdgeInsets.only(bottom: 18),
        child: Container(
          height: 50,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(),
                foregroundColor: Colors.red,
                shadowColor: white
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.close,color: Colors.red,)),
        ),
        )
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(showStatus: true,
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }
}