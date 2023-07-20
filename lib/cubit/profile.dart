import 'dart:async';

class ProfileModelBloc{
  String? _userProfileUrl;
  String _userSelfIntroduce = "";
  String _userFavoriteTravel = "";
  int _userPostMount = 0;
  int _userFollower = 0;
  int _userFollowing = 0;

  final StreamController<int> _ProfileModelSubject = StreamController<int>();

  Stream<int> get ProfileModel => _ProfileModelSubject.stream;

  add(){
    _userPostMount++;
    _ProfileModelSubject.sink.add(_userPostMount);
  }
}