import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return const Placeholder();
  }
}
