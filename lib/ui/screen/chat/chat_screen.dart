import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/cubit/chat/chat_cubit.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';
import 'package:nuri/ui/screen/chat/model/message_chat.dart';
import 'package:nuri/ui/screen/chat/widget/chat_input_field.dart';
import 'package:nuri/ui/widget/nuri_dialog.dart';

class ChatScreen extends StatefulWidget {
  ChatScreenArguments chatArg;

  ChatScreen({required this.chatArg});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  late String myId;
  late String peerId;
  List<QueryDocumentSnapshot> listMessage = [];
  var timestamps = [];
  int _limit = 50;
  int _limitIncrement = 50;
  String groupChatId = "";
  File? imageFile;
  bool isLoading = false;
  String imageUrl = "";
  String myName = "";
  String peerName = "";
  String peerProfile = "";
  String myProfile = "";
  String openDate = "";

  late ChatCubit chatCubit;

  late DocumentReference reference;

  var peerChattingIn = false;

  var checked = false;
  var valid = false;
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  void checkChatting() async {
    if (peerId == "") {
      Future.delayed(Duration.zero, () {
        // showSnackBar(context: context, text: "채팅 사용자가 없습니다.");
        Navigator.pop(context);
      });
    }
    if (peerId == myId) {
      Future.delayed(Duration.zero, () {
        Navigator.pop(context);
      });
    } else {
      checked = true;
    }
  }

  // 채팅 내역을 위한 스크롤
  _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listMessage.length) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  // stream node focus
  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        //isShowSticker = false;
      });
    }
  }

  // bool 데이터 get
  getSnapshotBool(DocumentSnapshot snapshot, String key) {
    try {
      return snapshot.get(key);
    } catch (error) {
      return false;
    }
  }

  // String 데이터 get
  getSnapshotString(DocumentSnapshot snapshot, String key) {
    try {
      return snapshot.get(key);
    } catch (error) {
      return "";
    }
  }

  void readLocal() async {
    // 상대 이름
    peerName = widget.chatArg.peerNickname;
    // 상대 사진
    peerProfile = widget.chatArg.peerImageUrl;
    myName =
        (widget.chatArg.myNickname == null ? "" : widget.chatArg.myNickname)!;
    // 그룹아이디가 없을 때 생성함
    if (widget.chatArg.chatRoomId == null || widget.chatArg.chatRoomId == "") {
      if (myId.compareTo(peerId) > 0) {
        groupChatId = '$myId-$peerId@$myName-$peerName';
      } else {
        groupChatId = '$peerId-$myId@$peerName-$myName';
      }
    } else {
      groupChatId = widget.chatArg.chatRoomId!;
    }
    valid = await chatCubit.attendChattingRoom(
        collectionPath: ChatConstants.pathMessageCollection,
        docPath: groupChatId,
        myName: myName,
        peerName: peerName,
        myId: myId,
        peerId: peerId);
    reference = FirebaseFirestore.instance
        .collection(ChatConstants.pathMessageCollection)
        .doc(groupChatId);
    reference.snapshots().listen((querySnapshot) {
      if (mounted) {
        setState(() {
          peerChattingIn =
              getSnapshotBool(querySnapshot, peerId + 'chattingIn');
          chatCubit
              .checkValidChattingRoom(groupChatId)
              .then((value) => valid = value);
        });
      }
    });
  }

  // 이미지 업데이트
  Future onSendImage(String filePath) async {
    File? imageFile;
    imageFile = File(filePath);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatCubit.uploadFile(imageFile, fileName, myId);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, TypeMessage.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e.message ?? e.toString());
    }
  }

  // 메시지 보내기
  void onSendMessage(String content, int type) async {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatCubit.sendMessage(
          content: content,
          type: type,
          groupChatId: groupChatId,
          myId: myId,
          peerId: peerId,
          peerChatingIn: peerChattingIn);

      if (listScrollController.hasClients)
        listScrollController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      if (peerChattingIn == false) {
        // NotificationService().sendPush(
        //     context,
        //     widget.chatArg.jackCrew ? PushType.jcrew_chat : PushType.chat,
        //     userId,
        //     widget.chatArg.jackCrew
        //         ? widget.chatArg.userNickname.toString()
        //         : pushWhoUserName,
        //     widget.chatArg.peerId,
        //     widget.chatArg.peerNickname,
        //     "",
        //     -1,
        //     -1,
        //     "",
        //     groupChatId);
      }
    } else {
      print('Nothing to send');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    chatCubit = context.read<ChatCubit>();
    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);

    myId = (widget.chatArg.myId == null
        ? LocalStorage().getUserIdToken()
        : widget.chatArg.myId)!;
    peerId = widget.chatArg.peerId;
    openDate = widget.chatArg.openDate ?? "";
    // 사용 가능한 채팅인지 확인
    checkChatting();
    readLocal();

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (checked) {
      switch (state) {
        case AppLifecycleState.resumed:
          print("app in resumed");
          chatCubit
              .chattingInRoom(
                  collectionPath: ChatConstants.pathMessageCollection,
                  docPath: groupChatId,
                  myId: myId)
              .then((value) => valid = value);
          break;
        case AppLifecycleState.inactive:
          print("app in inactive");
          chatCubit.chattingInRoom(
              collectionPath: ChatConstants.pathMessageCollection,
              docPath: groupChatId,
              myId: myId);
          break;
        case AppLifecycleState.paused:
          print("app in paused");
          break;
        case AppLifecycleState.detached:
          print("app in detached");
          break;
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  // 채팅 내용과 프로필
  Widget buildItem(int size, int index, DocumentSnapshot? document) {
    if (document != null) {
      MessageChat messageChat = MessageChat.fromDocument(document);
      // 내 텍스트와 상대방 텍스트를 나누기 위함
      if (messageChat.idFrom == myId) {
        // Right (my message)
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // Time
            isLastMessageRight(index) && messageChat.type != TypeMessage.leave
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          DateFormat('aa hh:mm', 'ko').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(messageChat.timestamp))),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.sp,
                          ),
                        ),
                        margin: EdgeInsets.only(
                            left: 4.w, top: 1.w, bottom: 25.w, right: 4.w),
                      )
                    ],
                  )
                : SizedBox.shrink(),
            messageChat.type == TypeMessage.text
                // Text
                ? Container(
                    child: Text(
                      //  채팅 내용
                      messageChat.content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
                    //width: 230.w,
                    constraints:
                        BoxConstraints(minWidth: 30.w, maxWidth: 230.w),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(18)),
                    margin: EdgeInsets.only(
                        bottom: isLastMessageRight(index) ? 20.w : 10.w,
                        right: 10.w),
                  )
                : messageChat.type == TypeMessage.image
                    // Image
                    ? Container(
                        child: GestureDetector(
                          onTap: () {
                            showImageDetail(messageChat.content);
                          },
                          child: Material(
                            child: Image.network(
                              messageChat.content,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  width: 230.w,
                                  height: 200.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Constants.theme4,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, object, stackTrace) {
                                return Material(
                                  child: Image.asset(
                                    'assets/images/profile_img_default.png',
                                    width: 230.w,
                                    height: 200.h,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                );
                              },
                              width: 230.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            clipBehavior: Clip.hardEdge,
                          ),
                        ),
                        margin: EdgeInsets.only(
                            bottom: isLastMessageRight(index) ? 20.w : 10.w,
                            right: 10.w),
                      )
                    // leave out message
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          messageChat.content,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                      ),
            isLastMessageRight(index) && messageChat.type != TypeMessage.leave
                ? Container(
                    margin: EdgeInsets.only(
                        bottom: isLastMessageRight(index) ? 20.w : 10.w),
                    child: Material(
                      child: myProfile.contains('http')
                          ? ClipOval(
                              child: Container(
                                width: 35.h,
                                height: 35.h,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(myProfile),
                                    )),
                              ),
                            )
                          : Container(width: 35.w),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      clipBehavior: Clip.hardEdge,
                    ))
                : Container(
                    margin: EdgeInsets.only(
                        bottom: isLastMessageRight(index) ? 20.w : 10.w,
                        right: 1.w),
                  )
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        );
      } else {
        // Left (peer message)
        var lineFeed = messageChat.content.split("\n");
        return Container(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  isLastMessageLeft(index) &&
                          messageChat.type != TypeMessage.leave
                      ? Container(
                          padding: EdgeInsets.only(
                              bottom: messageChat.type == TypeMessage.image
                                  ? 170.h
                                  : ((lineFeed.length - 1) * 17.h) + 5.h),
                          child: Material(
                            child: peerProfile.contains('http')
                                ? ClipOval(
                                    child: Container(
                                    width: 35.h,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(peerProfile),
                                        )),
                                  ))
                                : Icon(Icons.person),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            clipBehavior: Clip.hardEdge,
                          ))
                      : Container(width: 35.w),
                  messageChat.type == TypeMessage.text
                      ? Container(
                          child: Text(
                            messageChat.content,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
                          //width: 230.w,
                          constraints:
                              BoxConstraints(minWidth: 30.w, maxWidth: 230.w),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(18)),
                          margin: EdgeInsets.only(bottom: 4.w, left: 10.w),
                        )
                      : messageChat.type == TypeMessage.image
                          ? Container(
                              child: TextButton(
                                child: Material(
                                  child: Image.network(
                                    messageChat.content,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        width: 230.w,
                                        height: 200.h,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Constants.theme4,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, object, stackTrace) =>
                                            Material(
                                      child: Image.asset(
                                        'assets/images/img_not_available.jpeg',
                                        width: 230.w,
                                        height: 200.h,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                    ),
                                    width: 230.w,
                                    height: 200.h,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  clipBehavior: Clip.hardEdge,
                                ),
                                onPressed: () {
                                  showImageDetail(messageChat.content);
                                },
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(0))),
                              ),
                              margin: EdgeInsets.only(left: 10.w),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                messageChat.content,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 10.w, right: 10.w),
                            ),
                  // Time
                  isLastMessageLeft(index) &&
                          messageChat.type != TypeMessage.leave
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                DateFormat('aa hh:mm', 'ko').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(messageChat.timestamp))),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.sp,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                  left: 4.w,
                                  top: 25.w,
                                  bottom: 1.w,
                                  right: 4.w),
                            )
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          margin: EdgeInsets.only(bottom: 10.w),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  // 이미지 자세히 보기
  Future showImageDetail(String imgPath) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Stack(
            children: [
              Container(
                color: Colors.black,
              ),
              // PhotoViewGallery.builder(
              //   scrollPhysics: const BouncingScrollPhysics(),
              //   itemCount: 1,
              //   builder: (context, index) {
              //     ImageProvider img;
              //     if (imgPath.contains("http")) {
              //       img = ExtendedImage.network(imgPath).image;
              //     } else {
              //       img = ExtendedImage.asset(imgPath).image;
              //     }
              //     return PhotoViewGalleryPageOptions(
              //       onTapUp: (context, details, controllerValue) =>
              //           Navigator.pop(context),
              //       imageProvider: img,
              //       initialScale: PhotoViewComputedScale.contained * 1,
              //
              //       // heroAttributes: PhotoViewHeroAttributes(tag: '$index / ${_images.length}'),
              //     );
              //   },
              // ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ],
          );
        });
      },
    );
  }

  bool isChangeDate(int index) {
    //print(index.toString() +":" + size.toString());
    if (timestamps.contains(index)) {
      return true;
    } else {
      return false;
    }
  }

// 상대방 마지막 메시지
  bool isLastMessageLeft(int index) {
    if ((index > 0 &&
            listMessage[index - 1].get(ChatConstants.idFrom) == myId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

// 내 마지막 메시지
  bool isLastMessageRight(int index) {
    if ((index > 0 &&
            listMessage[index - 1].get(ChatConstants.idFrom) != myId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _onWillPop() async {
    if (checked) {
      var value = await chatCubit.chattingOutRoom(
          collectionPath: ChatConstants.pathMessageCollection,
          docPath: groupChatId,
          myId: myId);

      if (value) {
        await nuriDialog(context, [Text("종료된 채팅방입니다")]);
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // List of messages
                    buildListMessage(),
                    // Input content
                    ChatInputField(
                        messageSend: onSendMessage,
                        imageSend: onSendImage,
                        valid: valid),
                    //buildInput(),
                  ],
                ),
                // Loading
                buildLoading()
              ],
            ),
          ),
        ));
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(
            color:Constants.theme4,
          ),
        ),
        color: Colors.white.withOpacity(0.8),
      ) : SizedBox.shrink(),
    );
  }

  Widget buildListMessage() {
    return Flexible(
      child: groupChatId.isNotEmpty
          ? StreamBuilder<QuerySnapshot>(
              stream: chatCubit.getChatStream(groupChatId: groupChatId, limit: _limit),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  listMessage = snapshot.data!.docs;
                  timestamps = [];
                  if (listMessage.length > 0) {
                    for (int i = listMessage.length - 1; i >= 0; i--) {
                      if (i == listMessage.length - 1) {
                        timestamps.add(i);
                      } else {
                        var v1 = listMessage[i];
                        var v2 = listMessage[i + 1];
                        var c = v1.get(ChatConstants.content);
                        String dd1 = DateFormat('yyyyMMdd').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(v1.get(ChatConstants.timestamp))));
                        String dd2 = DateFormat('yyyyMMdd').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(v2.get(ChatConstants.timestamp))));
                        if (dd1 != dd2) {
                          timestamps.add(i);
                        }
                      }
                      //var kk = listMessage[i];
                      //String kd = DateFormat('yyyyMMdd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(kk.get(ChatConstants.timestamp))));
                      //print('${kd}---${kk.data()}');
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox.shrink(),
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            isChangeDate(index)
                                ? Container(
                                    height: 20.h,
                                    width: 200.w,
                                    //decoration: BoxDecoration(color: Constants.colorGrey5, borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //Icon(Icons.calendar_month, color: Colors.black, size: 12.w,),
                                        Image.asset(
                                          'assets/images/ico_cal.png',
                                          width: 14.w,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          DateFormat('yyyy년 MM월 dd일 EEEE', 'ko')
                                              .format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      int.parse(snapshot
                                                          .data?.docs[index]
                                                          .get('timestamp')))),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 80.w,
                                        top: 5.h,
                                        bottom: 5.h,
                                        right: 80.w),
                                  )
                                : SizedBox.shrink(),
                            buildItem(listMessage.length, index,
                                snapshot.data?.docs[index]),
                          ],
                        );
                      },
                      itemCount: snapshot.data!.size,
                      reverse: true,
                      controller: listScrollController,
                    );
                  } else {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 36.r, right: 35.r),
                        child: Text(
                          "좋은말로 먼저 인사를 해보아요",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              height: 1.83),
                        ),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Constants.theme4,
                    ),
                  );
                }
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: Constants.theme4,
              ),
            ),
    );
  }
}

class ChatScreenArguments {
  final String peerId;
  final String peerImageUrl;
  final String peerNickname;
  final String? myId;
  final String? myImageUrl;
  final String? myNickname;
  final String? chatRoomId;
  final String? openDate;

  ChatScreenArguments({
    required this.peerId,
    required this.peerImageUrl,
    required this.peerNickname,
    this.myId,
    this.myImageUrl,
    this.myNickname,
    this.chatRoomId,
    this.openDate,
  });
}
