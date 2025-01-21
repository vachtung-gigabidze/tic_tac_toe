import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';

class SizedIcon extends StatelessWidget {
  const SizedIcon({
    super.key,
    required this.name,
    required this.size,
  });

  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size,
        width: size,
        child: Image.asset(
          name,
          fit: BoxFit.scaleDown,
        ));
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    this.height = 69,
    this.width = 245,
    this.color,
    this.onPressed,
  });
  final Widget text;
  final Widget? icon;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var c = color ?? K.basicLightBlue;
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoButton(
          padding: EdgeInsets.all(0),
          disabledColor: c,
          color: c,
          borderRadius: BorderRadius.circular(30),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(
                  width: 10,
                )
              ],
              text,
            ],
          )),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.size = 20,
    this.weight = FontWeight.w700,
    this.color,
  });

  final dynamic text;
  final double size;
  final FontWeight weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color c = color ?? K.basicBlack;
    return Text(
      text,
      style: TextStyle(
          color: c,
          fontSize: size,
          fontFamily: '.SF UI Display',
          fontWeight: weight),
    );
  }
}
