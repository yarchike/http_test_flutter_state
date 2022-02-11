import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_test_flutter/bloc/user_block.dart';
import 'package:http_test_flutter/bloc/user_event.dart';

class  ActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final UserBlock userBlock = BlocProvider.of<UserBlock>(context);
    return Row(
      mainAxisSize:  MainAxisSize.min,
      children: [
        RaisedButton(
          child: Text('Load'),
          onPressed: (){
            userBlock.add(UserLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: (){
            userBlock.add(UserClearEvent());
          },
          color: Colors.red,
        ),
      ],
    );
  }
}
