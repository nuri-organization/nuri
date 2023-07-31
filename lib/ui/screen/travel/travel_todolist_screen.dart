import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/cubit/travel/todo/travel_todolist_cubit.dart';

class TravelTodoListScreen extends StatefulWidget {
  TravelTodoListScreen({super.key, required this.travelId});
  String travelId;

  @override
  State<TravelTodoListScreen> createState() => _TravelTodoListScreenState();
}

class _TravelTodoListScreenState extends State<TravelTodoListScreen> {

  @override
  void initState() {
    context.read<TravelTodolistCubit>().getTodoList(travelId: widget.travelId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
