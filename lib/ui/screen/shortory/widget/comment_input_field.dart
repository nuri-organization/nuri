import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/ui/common/nuri_dialog.dart';

// 채팅 입력창
class CommentInputField extends StatefulWidget {
  void Function(String) message;
  CommentInputField({required this.message});

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {

  // 댓글창 입력 컨트롤러
  final TextEditingController _textController = TextEditingController();

  // 댓글 입력창 style
  static final _borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(
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
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
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
                fillColor: Colors.white54,
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: 18.w,
                  right: 4.w,
                  top: 7.h,
                  bottom: 7.h,
                ),
                hintText: '메시지 입력',
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
                    FocusScope.of(context).unfocus();
                    setState(() {
                      widget.message(_textController.text);
                      _textController.clear();
                    });
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Constants.theme4,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_upward, color: Colors.black,)),
                ) : null,
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