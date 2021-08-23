import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:structurepublic/src/models/MarketData.dart';

class MyHomeChat extends StatefulWidget {
  MarketData marketData;
  MyHomeChat(this.marketData);
  @override
  _MyHomeChat createState() => _MyHomeChat(this.marketData);
}

class _MyHomeChat extends State<MyHomeChat> {
  MarketData marketData;
  _MyHomeChat(this.marketData);
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  String uid;





  final ChatUser otherUser = ChatUser(
    name: "Hala",
    uid: "25649654",
  //  avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController
          ..animateTo(
            _chatViewKey
                .currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    print(message.toJson());
    FirebaseFirestore.instance
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());
    /* setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    } */
  }

  @override


  Widget build(BuildContext context)

  {
    final ChatUser user = ChatUser(
      name: marketData.nameAr,
      uid:marketData.id ,
      //   avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(marketData.nameAr),
        backgroundColor: Theme.of(context).primaryColorDark,
        leading:CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(marketData.imageIcon) ,maxRadius: 0.1,),
      ),
      body:
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('messages').where("user.uid",isEqualTo:marketData.id)
            //  .orderBy("createdAt")
              .snapshots(),
          builder: (context, snapshot) {

             Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            );
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              );
            } else {
              List<DocumentSnapshot> items = snapshot.data.docs;
              var messages =
              items.map((i) => ChatMessage.fromJson(i.data())).toList();
              return DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: onSend,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                inputDecoration:
                InputDecoration.collapsed(hintText: "Add message here...",hintStyle:TextStyle(color: Colors.white), ),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: true,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.black38,
                ),
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState.scrollController
                      ..animateTo(
                        _chatViewKey.currentState.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    if (i == 0) {
                      systemMessage();
                      Timer(Duration(milliseconds: 600), () {
                        systemMessage();
                      });
                    } else {
                      systemMessage();
                    }
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                showTraillingBeforeSend: true,
                trailing: <Widget>[
                  // IconButton(
                  //   icon: Icon(Icons.photo),
                  //   onPressed: () async {
                  //     final picker = ImagePicker();
                  //     PickedFile result = await picker.getImage(
                  //       source: ImageSource.gallery,
                  //       imageQuality: 80,
                  //       maxHeight: 100,
                  //       maxWidth:600,
                  //     );
                  //
                  //     if (result != null) {
                  //       final Reference storageRef =
                  //       FirebaseStorage.instance.ref().child("chat_images");
                  //
                  //       final taskSnapshot = await storageRef.putFile(
                  //         File(result.path),
                  //         SettableMetadata(
                  //           contentType: 'image/jpg',
                  //         ),
                  //       );
                  //
                  //       String url = await taskSnapshot.ref.getDownloadURL();
                  //
                  //       ChatMessage message =
                  //       ChatMessage(text: "", user: user, image: url);
                  //
                  //       FirebaseFirestore.instance
                  //           .collection('messages')
                  //           .add(message.toJson());
                  //     }
                  //   },
                  // )
                ],
              );
            }
          }),
  );
  }
}










// import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';
//
// class MyApppp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final title = 'Fade in images';
//
//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Stack(
//           children: <Widget>[
//             Center(child: CircularProgressIndicator()),
//             Center(
//               child: FadeInImage.memoryNetwork(
//                 placeholder: kTransparentImage,
//                 image: 'https://picsum.photos/250?image=9',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }