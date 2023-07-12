import 'dart:async';

class ProfileInfoBloc{
  String? _userProfileUrl;
  String _userSelfIntroduce = "";
  String _userFavoriteTravel = "";
  int _userPostMount = 0;
  int _userFollower = 0;
  int _userFollowing = 0;

  final StreamController<int> _profileInfoSubject = StreamController<int>();

  Stream<int> get profileInfo => _profileInfoSubject.stream;

  add(){
    _userPostMount++;
    _profileInfoSubject.sink.add(_userPostMount);
  }
}