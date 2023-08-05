import 'package:flutter/material.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/travel/travel_checklist_screen.dart';
import 'package:nuri/ui/screen/travel/travel_member_screen.dart';
import 'package:nuri/ui/screen/travel/travel_todolist_screen.dart';

class TravelPartyScreen extends StatefulWidget {
  TravelPartyScreen({super.key,required this.travelId});

  String travelId;

  @override
  State<TravelPartyScreen> createState() => _TravelPartyScreenState();
}

class _TravelPartyScreenState extends State<TravelPartyScreen> {

  int index = 0;

  void _setCurrentData(int currentData){
    setState(() {
      index = currentData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TravelTile(
                    onTap: (){
                      _setCurrentData(0);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TravelMemberScreen(travelId: widget.travelId,)));
                    },
                    title: "멤버 보기"
                ),
                TravelTile(
                    onTap: (){
                      _setCurrentData(1);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TravelTodoListScreen(travelId: widget.travelId)));
                    },
                    title: "TODO - 리스트"
                ),
                TravelTile(
                    onTap: (){
                      _setCurrentData(2);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TravelCheckListScreen(travelId: widget.travelId)));
                    },
                    title: "CheckList"
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TravelTile extends StatelessWidget {
  TravelTile({super.key, required this.title, required this.onTap});

  String title;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        child: Center(child: Text(title)),
      ),
    );
  }
}
