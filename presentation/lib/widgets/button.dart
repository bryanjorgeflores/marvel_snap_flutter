import 'package:flutter/material.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final double percentWidth;
  final double fontSize;
  final bool hasBorder;
  final bool hasIcon;
  final bool isTextBold;
  final Color borderColor;
  final double borderRadius;
  final IconData icon;
  const CustomButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.buttonColor = primary,
      this.textColor = white,
      this.height = 50,
      this.percentWidth = 0.5,
      this.fontSize = 14,
      this.hasBorder = false,
      this.hasIcon = false,
      this.isTextBold = false,
      this.borderColor = white,
      this.borderRadius = 10,
      this.icon = Icons.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * percentWidth,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(1),
          backgroundColor: onPressed != null
              ? MaterialStateProperty.all<Color>(buttonColor)
              : MaterialStateProperty.all<Color>(grey),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: hasBorder
                  ? BorderSide(
                      color: borderColor,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon)
              Icon(
                icon,
                color: textColor,
              ),
            Expanded(
              child: TextWidget(
                text: text,
                color: textColor,
                fontWeight: isTextBold ? FontWeight.bold : FontWeight.normal,
                fontSize: fontSize,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
