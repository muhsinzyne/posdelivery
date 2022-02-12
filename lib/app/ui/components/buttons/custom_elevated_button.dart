import 'package:flutter/material.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';

class CElevatedButton extends StatelessWidget {
  final String label;
  final TextStyle textStyle;
  final Color textColor;

  final Function onPress;
  final Color bgColor;

  const CElevatedButton({
    Key key,
    this.label = '',
    this.textStyle,
    this.textColor = Colors.white,
    this.bgColor,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: textStyle != null ? textStyle.copyWith(color: textColor) : TextStyle(color: textColor),
      ),
      onPressed: onPress ?? () {},
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity(
          horizontal: VisualDensity.maximumDensity,
          vertical: VisualDensity.maximumDensity,
        ),
        primary: bgColor ?? AppColors.primary,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
