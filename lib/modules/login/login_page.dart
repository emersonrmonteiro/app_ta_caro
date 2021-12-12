import 'package:app_ta_caro/shared/theme/app_theme.dart';
import 'package:app_ta_caro/shared/widgets/button/button.dart';
import 'package:app_ta_caro/shared/widgets/input_text/input_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 200,
              ),
              InputText(label: 'Email', hint: 'Digite seu email'),
              SizedBox(height: 18),
              InputText(label: 'Senha', hint: 'Digite sua senha'),
              SizedBox(height: 14),
              Button(
                label: 'Entrar',
                type: ButtonType.fill,
              ),
              SizedBox(height: 50),
              Button(
                label: 'Criar Conta',
                type: ButtonType.outline,
              ),
            ],
          ),
        ));
  }
}
