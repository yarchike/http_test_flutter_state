import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_test_flutter/bloc/user_event.dart';
import 'package:http_test_flutter/bloc/user_state.dart';
import 'package:http_test_flutter/services/user_repository.dart';

import '../model/user.dart';

class UserBlock extends Bloc<UserEvent, UserState>{
  final UserRepository userRepository;


  UserBlock({required this.userRepository}) : assert(userRepository != null);

  @override
  UserState get initialState => UserEmptyState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
        if(event is UserLoadEvent){
          yield UserLoadingState();
          try{
            final List<User> _loadetUserlist = await userRepository.getAllUsers();
            yield UserLoadedState(loadedUser: _loadetUserlist);
          }catch(_){
            yield UserErrorState();
          }
        }else if(event is UserClearEvent){
          yield UserEmptyState();
        }
  }









}