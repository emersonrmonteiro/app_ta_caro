import 'package:app_ta_caro/modules/login/login_controller.dart';
import 'package:app_ta_caro/shared/theme/app_theme.dart';
import 'package:app_ta_caro/shared/utils/state.dart';
import 'package:app_ta_caro/shared/widgets/button/button.dart';
import 'package:app_ta_caro/shared/widgets/input_text/input_text.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final controller = LoginController();

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
        success: (value) => Navigator.pushNamed(context, '/home'),
        error: (message, _) => scaffoldState.currentState!.showBottomSheet(
          (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Text(message),
          ),
        ),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        backgroundColor: AppTheme.colors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                ),
                InputText(
                  label: 'Email',
                  hint: 'Digite seu email',
                  validator: (value) =>
                      isEmail(value) ? null : 'Digite um email válido',
                  onChange: (value) => controller.onChange(email: value),
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  validator: (value) =>
                      value.length >= 6 ? null : 'Digite uma senha mais forte',
                  obscure: true,
                  onChange: (value) => controller.onChange(password: value),
                ),
                SizedBox(height: 14),
                AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                    loading: () => CircularProgressIndicator(),
                    orElse: () => Column(
                      children: [
                        Button(
                          label: 'Entrar',
                          type: ButtonType.fill,
                          onTap: () {
                            controller.login();
                          },
                        ),
                        SizedBox(height: 50),
                        Button(
                          label: 'Criar Conta',
                          type: ButtonType.outline,
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/login/create-account');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
