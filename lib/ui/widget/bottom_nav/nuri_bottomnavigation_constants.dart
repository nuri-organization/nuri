import 'package:flutter/material.dart';
import 'nuri_bottomnavigation_item.dart';

final bottomNavigator = [
  const NuriBottomNavigationItem(
      initialLocation: '/bottom/community' ,
      icon: Icon(Icons.chat),
      label: "커뮤니티"
  ),
  const NuriBottomNavigationItem(
      initialLocation: '/bottom/map' ,
      icon: Icon(Icons.map_outlined),
      label: "지도"
  ),
  const NuriBottomNavigationItem(
      initialLocation: '/bottom/travel' ,
      icon: Icon(Icons.backpack),
      label: "여행"
  ),
  const NuriBottomNavigationItem(
      initialLocation: '/bottom/profile' ,
      icon: Icon(Icons.person),
      label: "프로필"
  )
];

const List<BottomNavigationBarItem> options = <NuriBottomNavigationItem>[
  NuriBottomNavigationItem(
      initialLocation: '/bottom/community' ,
      icon: Icon(Icons.chat),
      label: "커뮤니티"
  ),
   NuriBottomNavigationItem(
      initialLocation: '/bottom/map' ,
      icon: Icon(Icons.map_outlined),
      label: "지도"
  ),
   NuriBottomNavigationItem(
      initialLocation: '/bottom/travel' ,
      icon: Icon(Icons.backpack),
      label: "여행"
  ),
   NuriBottomNavigationItem(
      initialLocation: '/bottom/profile' ,
      icon: Icon(Icons.person),
      label: "프로필"
  )
];