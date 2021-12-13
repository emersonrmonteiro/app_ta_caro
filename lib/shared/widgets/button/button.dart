import 'package:app_ta_caro/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { fill, outline, none }

class Button extends StatelessWidget {
  final String label;
  final ButtonType type;
  final Function() onTap;
  const Button({
    Key? key,
    required this.label,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  TextStyle get textStyle {
    switch (type) {
      case ButtonType.fill:
        return AppTheme.textStyles.buttonBackgroundColor;
      case ButtonType.outline:
        return AppTheme.textStyles.buttonBoldTextColor;
      case ButtonType.none:
        return AppTheme.textStyles.buttonTextColor;
      default:
        throw 'invalid type';
    }
  }

  BoxDecoration get boxDecoration {
    switch (type) {
      case ButtonType.fill:
        return BoxDecoration(
            color: AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(10));
      case ButtonType.outline:
        return BoxDecoration(
            color: AppTheme.colors.background,
            border: Border.fromBorderSide(
              BorderSide(
                color: AppTheme.colors.border,
                width: 2,
              ),
            ),
            borderRadius: BorderRadius.circular(10));
      case ButtonType.none:
        return BoxDecoration(color: Colors.transparent);
      default:
        throw 'invalid type';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58,
        width: double.maxFinite,
        decoration: boxDecoration,
        child: Center(
          child: Text(label, style: textStyle),
        ),
      ),
    );
  }
}
