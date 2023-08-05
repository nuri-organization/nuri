import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/travel/todo/travel_todolist_cubit.dart';
import 'package:nuri/data/local/todo_data.dart';

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
    return NuriScaffold(
      child: BlocBuilder<TravelTodolistCubit, TravelTodolistState>(
        builder: (context, state) {
          if(state.loadingStatus == LoadingStatus.success){
            return SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.add)
                  )
                ],
              ),
            );
          }
          if(state.loadingStatus == LoadingStatus.noData){
            return Column(
              children: [
                Container(child: Center(child: Text("아직 데이터가 없어용 ~"),),),
                IconButton(
                    onPressed: (){
                      TodoData().addList(content: "");
                    }, 
                    icon: Icon(Icons.add)
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
