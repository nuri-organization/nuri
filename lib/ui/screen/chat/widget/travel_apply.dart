import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/cubit/chat/chat_cubit.dart';
import 'package:nuri/cubit/travel/accept/travel_accept_cubit.dart';
import 'package:nuri/cubit/travel/member/travel_member_cubit.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';

class TravelApply extends StatelessWidget {
  TravelApply({super.key, required this.travelId, required this.peerId});
  int travelId;
  String peerId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                context.read<ChatCubit>().delChattingRoom(ChatConstants.pathMessageCollection);
              },
              child: const Center(child: Text("거절하기"),),
            ),
            InkWell(
              onTap: (){
                context.read<TravelAcceptCubit>().userAccept(userId: peerId, respond: true, travelId: travelId);
              },
              child: const Center(child: Text("허용하기"),),
            ),
          ],
        )
    );
  }
}
