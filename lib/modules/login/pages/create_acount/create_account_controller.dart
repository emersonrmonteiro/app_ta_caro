import 'package:flutter/material.dart';

import '../../../../shared/model/user_model.dart';
import '../../../../shared/services/app_database.dart';
import '../../../../shared/utils/state.dart';
import '../../repositories/login_repository_impl.dart';

class CreateAccountController extends ChangeNotifier {
  final LoginRepositoryImpl repository;
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

  CreateAccountController({required this.repository});

  void onChange({String? name, String? email, String? password}) {
    _name = name ?? _name;
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

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await AppDatabase.instance.createAccount(
          name: _name,
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
