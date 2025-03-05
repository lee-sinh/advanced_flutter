import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3-BLABLA-PROJECT/widgets/actions/bla_icon_button.dart';
import '../../../theme/theme.dart';

// This widget represents a selectable tile on the Ride Preference screen
class RidePrefInputTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData leftIcon;

  // If true, the text is displayed lighter
  final bool isPlaceHolder;

  // An optional right button can be provided
  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;

  const RidePrefInputTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.leftIcon,
    this.rightIcon,
    this.onRightIconPressed,
    this.isPlaceHolder = false,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = isPlaceHolder ? BlaColors.textLight : BlaColors.textNormal;

    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor),
      ),
      leading: Icon(
        leftIcon,
        size: BlaSize.icon,
        color: BlaColors.iconLight,
      ),
      trailing: rightIcon != null
          ? BlaIconButton(icon: rightIcon, onPressed: onRightIconPressed)
          : null,
    );
  }
}