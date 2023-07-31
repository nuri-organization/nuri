import 'package:flutter/material.dart';

class TravelPartyScreen extends StatefulWidget {
  const TravelPartyScreen({super.key});

  @override
  State<TravelPartyScreen> createState() => _TravelPartyScreenState();
}

class _TravelPartyScreenState extends State<TravelPartyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TravelTile(title: "멤버 보기"),
        TravelTile(title: "TODO - 리스트"),
        TravelTile(title: "CheckList")
      ],
    );
  }
}

class TravelTile extends StatelessWidget {
  TravelTile({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        
      },
      child: Container(
        height: 30,
        child: Text(title),
      ),
    );
  }
}
