import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return const Placeholder();
  }
}
