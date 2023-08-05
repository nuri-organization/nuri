import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/travel/check/travel_checklist_cubit.dart';

class TravelCheckListScreen extends StatefulWidget {
  TravelCheckListScreen({super.key, required this.travelId});

  String travelId;

  @override
  State<TravelCheckListScreen> createState() => _TravelCheckListScreenState();
}

class _TravelCheckListScreenState extends State<TravelCheckListScreen> {


  @override
  void initState() {
    context.read<TravelChecklistCubit>().getCheckList(travelId: widget.travelId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      child: BlocBuilder<TravelChecklistCubit, TravelChecklistState>(
        builder: (context, state) {
          if(state.loadingStatus == LoadingStatus.success){
            return SingleChildScrollView(
              child: Column(),
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
