import 'package:flutter/material.dart';
import 'nuri_bottomnavigation_item.dart';

enum NavBarItem {shortory, travel, chat, profile}

const List<BottomNavigationBarItem> options = <NuriBottomNavigationItem>[
  NuriBottomNavigationItem(
      initialLocation: '/bottom/community' ,
      icon: Icon(Icons.menu_book),
      label: "쇼토리"
  ),
  NuriBottomNavigationItem(
      initialLocation: '/bottom/map' ,
      icon: Icon(Icons.backpack),
      label: "여행"
  ),
  NuriBottomNavigationItem(
      initialLocation: '/bottom/travel' ,
      icon: Icon(Icons.forum),
      label: "채팅"
  ),
  NuriBottomNavigationItem(
      initialLocation: '/bottom/profile' ,
      icon: Icon(Icons.person),
      label: "프로필"
  )
];