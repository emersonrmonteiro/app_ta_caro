import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../../shared/services/app_database.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/widgets/button/button.dart';
import '../../../../shared/widgets/input_text/input_text.dart';
import '../../repositories/login_repository_impl.dart';
import 'create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  late final CreateAccountController controller;

  @override
  void initState() {
    controller = CreateAccountController(
        repository: LoginRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
        success: (value) => Navigator.pop(context),
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
        appBar: AppBar(
          backgroundColor: AppTheme.colors.background,
          leading: BackButton(
            color: AppTheme.colors.backButton,
          ),
          elevation: 0,
        ),
        backgroundColor: AppTheme.colors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Criando uma conta',
                  style: AppTheme.textStyles.title,
                ),
                SizedBox(height: 10),
                Text('Mantenha seus gastos em dia',
                    style: AppTheme.textStyles.subtitle),
                SizedBox(height: 38),
                InputText(
                  label: 'Nome',
                  hint: 'Digite seu nome completo',
                  validator: (value) =>
                      value.isNotEmpty ? null : 'Digite seu nome completo',
                  onChange: (value) => controller.onChange(name: value),
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'Email',
                  hint: 'Digite seu email',
                  validator: (value) =>
                      isEmail(value) ? null : 'Digite um email v??lido',
                  onChange: (value) => controller.onChange(email: value),
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  obscure: true,
                  validator: (value) =>
                      value.length >= 6 ? null : 'Digite uma senha mais forte',
                  onChange: (value) => controller.onChange(password: value),
                ),
                SizedBox(height: 14),
                AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                    loading: () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                    orElse: () => Button(
                      label: 'Criar Conta',
                      type: ButtonType.fill,
                      onTap: () {
                        controller.create();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
