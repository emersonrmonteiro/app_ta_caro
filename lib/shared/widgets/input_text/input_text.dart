import 'package:app_ta_caro/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final void Function(String)? onChange;
  final String? Function(String)? validator;
  const InputText({
    required this.label,
    required this.hint,
    this.onChange,
    this.validator,
    this.obscure = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(
          height: 12,
        ),
        TextFormField(
          obscureText: obscure,
          onChanged: onChange,
          validator: (value) {
            if (validator != null) {
              return validator!(value ?? '');
            }
          },
          decoration: InputDecoration(
            hintStyle: AppTheme.textStyles.hint,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppTheme.colors.border,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
