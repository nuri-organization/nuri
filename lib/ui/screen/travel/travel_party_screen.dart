import 'package:flutter/material.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/travel/travel_checklist_screen.dart';
import 'package:nuri/ui/screen/travel/travel_member_screen.dart';
import 'package:nuri/ui/screen/travel/travel_todolist_screen.dart';

class TravelPartyScreen extends StatefulWidget {
  const TravelPartyScreen({super.key});

  @override
  State<TravelPartyScreen> createState() => _TravelPartyScreenState();
}

class _TravelPartyScreenState extends State<TravelPartyScreen> {
  @override
  Widget build(BuildContext context) {
    print(LocalStorage().getTravelId());

    return LocalStorage().getTravelId() != "" ? Column(
      children: [
        TravelTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => TravelMemberScreen(travelId: LocalStorage().getTravelId(),)));
            },
            title: "멤버 보기"
        ),
        TravelTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => TravelTodoListScreen(travelId: LocalStorage().getTravelId())));
            },
            title: "TODO - 리스트"
        ),
        TravelTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => TravelCheckListScreen(travelId: LocalStorage().getTravelId())));
            },
            title: "CheckList"
        )
      ],
    ) : Center(child: Text("아직 가입된 여행이 없습니다. 원하는 여행을 찾아 가입해보세요!"),);
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
