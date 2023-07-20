import 'package:equatable/equatable.dart';
import 'package:nuri/ui/widget/bottom_nav/nuri_bottomnavigation_constants.dart';

class NavigationState extends Equatable{
  final NavBarItem navbarItem;
  final int index;

  NavigationState(this.index, this.navbarItem);

  @override
  List<Object> get props => [navbarItem, index];
}