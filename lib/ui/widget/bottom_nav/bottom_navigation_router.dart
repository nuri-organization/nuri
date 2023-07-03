import 'package:flutter/material.dart';
import 'package:nuri/ui/screen/community/community_screen.dart';
import 'package:nuri/ui/screen/map/map_screen.dart';
import 'package:nuri/ui/screen/profile/profile_screen.dart';
import 'package:nuri/ui/screen/travel/travel_screen.dart';

final List<Widget> widgetOptions = <Widget>[
  NuriCommunityScreen(),
  NuriMapScreen(),
  NuriTravelScreen(),
  NuriProfileScreen()
];