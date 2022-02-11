import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_test_flutter/bloc/user_block.dart';
import 'package:http_test_flutter/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBlock, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text(
            'Не данных, нажмите load',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                child: ListTile(
                  leading: Text(
                    "Id ${state.loadedUser[index].id}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: [
                      Text(
                        "${state.loadedUser[index].name}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Email: ${state.loadedUser[index].email}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Phone: ${state.loadedUser[index].phone}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
