import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/bloc/profile/profile_event.dart';
import 'package:nuri/bloc/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc(super.initialState);


  ProfileState get initialState => ProfileState.empty();

  Stream<ProfileState> mapEventToState(ProfileEvent event) async*{
    if(event is ProfileLoaded){
    }
  }

  // Stream<ProfileState> _mapProfileLoadedToState() async*{
  //   yield state.
  // }
}
