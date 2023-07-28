import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/ui/widget/nuri_dialog.dart';

// 채팅 입력창
class ChatInputField extends StatefulWidget {
  Function? messageSend; // 메네지 전송
  Function? imageSend; // 메네지 전송
  bool valid;
  ChatInputField({this.messageSend, this.imageSend, required this.valid});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  // 유저 정보 받아오기 위한 provider
  // late UserInfoProvider _userInfoProvider;

  // 댓글창 입력 컨트롤러
  final TextEditingController _textController = TextEditingController();

  // 댓글 입력창 style
  static final _borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(
      color: Colors.grey
    ),
  );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 댓글 입력창 커서가 항상 입력값 맨 뒤에 오도록 설정
    // _userInfoProvider = Provider.of<UserInfoProvider>(context);
    return Container(
      width: double.infinity,
      // decoration: BoxDecoration(
      //   border: Border(
      //     top: BorderSide(color: Constants.colorGrey6),
      //   ),
      // ),
      child: Container(
          width: 296.w,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 38.h,
              maxHeight: 300.h,
            ),
            child: TextFormField(
              controller: _textController,
              autocorrect: false,
              maxLength: 1000,
              minLines: 1,
              maxLines: 4,
              enabled: widget.valid,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              onChanged: (value) {
                setState(() {});
                // 댓글 최대 글자수 도달 시, 알림창 팝업
                if (value.length >= 1000) {
                  nuriDialog(context, [
                    Text('채팅은 1,000자까지 입력 가능해요.\n우선 달고, 하나 더 달까요?')
                  ]);
                }
              },
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: 18.w,
                  right: 4.w,
                  top: 7.h,
                  bottom: 7.h,
                ),
                hintText: widget.valid ? '메시지 입력' : '메시지 전송이 불가능합니다.',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  height: 1.0,
                ),
                counterText: '', // 현재 글자수/최대 글자수 표시 제거
                // 입력값 있을 시, 댓글 달기 버튼 활성화
                suffixIcon: _textController.text.isNotEmpty
                    ? GestureDetector(
                  onTap: () async {
                    //FocusScope.of(context).unfocus();
                    setState(() {
                      widget.messageSend!(_textController.text, 0);
                      _textController.clear();
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/ico_write_done.png',
                        width: 14.9.w,
                      )),
                )
                    : null,
                suffixIconConstraints: BoxConstraints(minHeight: 30.r, minWidth: 30.r),
                enabledBorder: _borderStyle,
                focusedBorder: _borderStyle,
                disabledBorder: _borderStyle,
              ),
            ),
          )),
    );
  }
}