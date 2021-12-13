import 'package:flutter/material.dart';

import '../../shared/model/user_model.dart';
import '../../shared/utils/state.dart';
import 'repositories/login_repository_impl.dart';

class LoginController extends ChangeNotifier {
  final LoginRepositoryImpl repository;
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  LoginController({
    required this.repository,
  });

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.login(
          email: _email,
          password: _password,
        );
        update(AppState.success<UserModel>(response));
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}
