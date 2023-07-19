import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProfileEvent extends Equatable{
}

class ProfileLoaded extends ProfileEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}