import 'package:app_ta_caro/shared/utils/state.dart';
import 'package:flutter/material.dart';

class CreateAccountController extends ChangeNotifier {
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

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
        await Future.delayed(Duration(seconds: 2));
        update(AppState.success<String>('Conta criada com sucesso'));
      } catch (e) {
        update(AppState.error('Não foi possível criar conta'));
      }
    }
  }
}
