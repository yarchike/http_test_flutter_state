
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_test_flutter/bloc/user_block.dart';
import 'package:http_test_flutter/services/user_repository.dart';

import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';


class HomePage extends StatelessWidget {
  final userReposytory =  UserRepository();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<UserBlock>(
      create: (context) => UserBlock(userRepository: userReposytory),
      child:      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Users List"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButton(),
            Expanded(child: UserList()),
          ],
        ),
      )

    );
  }
}
