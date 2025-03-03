import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3-BLABLA-PROJECT/theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final Icon? icon;
  final String text;
  final ButtonType buttonType;
  final VoidCallback onPressed;
  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {


    final Color bgColor;
    final Color textColor;
    if (buttonType == ButtonType.secondary){
      bgColor = BlaColors.backgroundAccent;
      textColor =  BlaColors.primary;
    }else{
       bgColor = BlaColors.backGroundColor;
       textColor = BlaColors.white;
    }



    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon?.icon,
                    color: textColor,
                    size: 20,
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ],
        ));
  }
}