import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/cubit/travel/my_travel/travel_my_travel_cubit.dart';
import 'package:nuri/ui/screen/error_screen.dart';
import 'package:nuri/ui/screen/travel/travel_party_screen.dart';

class TravelMyListScreen extends StatefulWidget {
  const TravelMyListScreen({super.key});

  @override
  State<TravelMyListScreen> createState() => _TravelMyListScreenState();
}

class _TravelMyListScreenState extends State<TravelMyListScreen> {

  @override
  void initState() {
    context.read<TravelMyTravelCubit>().getMyTravel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelMyTravelCubit, TravelMyTravelState>(
      builder: (context, state) {
        if(state.loadingStatus == LoadingStatus.success){
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount:  state.travelMyModel!.length ?? 0,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TravelPartyScreen(travelId: state.travelMyModel![index].travelId.toString(),)));
                    },
                    child: Row(
                      children: [
                        state.travelMyModel![index].isLeader ? Icon(Icons.star) : SizedBox(),
                        Container(
                          child: Text(state.travelMyModel![index].travelName),
                        ),
                      ],
                    ),
                  );
                }
            )
          );
        }
        if(state.loadingStatus == LoadingStatus.noData){
          return const Center(
            child: Text("아직 여행이 없네용 ~"),
          );
        }
        if(state.loadingStatus == LoadingStatus.fail){
          return const ErrorScreen();
        }
        return Container();
      },
    );
  }
}
