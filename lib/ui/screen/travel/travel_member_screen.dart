import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/travel/member/travel_member_cubit.dart';

class TravelMemberScreen extends StatefulWidget {
  TravelMemberScreen({super.key, required this.travelId});

  String travelId;

  @override
  State<TravelMemberScreen> createState() => _TravelMemberScreenState();
}

class _TravelMemberScreenState extends State<TravelMemberScreen> {

  @override
  void initState() {
    context.read<TravelMemberCubit>().getMember(travelId: widget.travelId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      child: BlocBuilder<TravelMemberCubit, TravelMemberState>(
        builder: (context, state) {
          if(state.loadingStatus == LoadingStatus.success){
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.userInfoModel!.length,
                  itemBuilder: (context, index){
                    return Row(
                      children: [
                        Text(state.userInfoModel![index].userProfile ?? ""),
                        Text(state.userInfoModel![index].userName),
                      ],
                    );
                  }
              ),
            );
          }
          if(state.loadingStatus == LoadingStatus.noData){
            return Container(child: Center(child: Text("아직 데이터가 없어용 ~"),),);
          }
          return Container();
        },
      ),
    );
  }
}
