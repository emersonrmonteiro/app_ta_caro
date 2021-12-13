import 'package:app_ta_caro/shared/utils/state.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

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
        await Future.delayed(Duration(seconds: 2));
        update(AppState.success<String>('usuário logado'));
      } catch (e) {
        update(AppState.error('Não foi possível realizar login'));
      }
    }
  }
}
