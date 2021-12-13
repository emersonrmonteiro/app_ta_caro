import 'package:flutter/material.dart';

import '../../shared/model/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Olá ${user.name}'),
      ),
    );
  }
}
