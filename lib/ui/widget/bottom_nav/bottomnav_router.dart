import 'package:flutter/material.dart';
import 'package:nuri/ui/screen/chat/chat_screen.dart';
import 'package:nuri/ui/screen/profile/profile_screen.dart';
import 'package:nuri/ui/screen/shortory/shortory_screen.dart';
import 'package:nuri/ui/screen/travel/travel_screen.dart';

final List<Widget> bottomNavRouter = <Widget>[
  NuriShortoryScreen(),
  NuriTravelScreen(),
  NuriChatScreen(),
  NuriProfileScreen(),
];
