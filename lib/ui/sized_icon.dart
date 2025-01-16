import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';

class SizedIcon extends StatelessWidget {
  const SizedIcon({
    super.key,
    this.name,
    this.size,
  });

  final name;
  final size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size, child: Image.asset(name));
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.icon,
  });
  final Widget text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      height: 69,
      child: CupertinoButton(
          color: K.basicLightBlue,
          borderRadius: BorderRadius.circular(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              text,
            ],
          ),
          onPressed: () {}),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.size = 20,
    this.weight = FontWeight.w700,
  });

  final dynamic text;
  final double size;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: K.basicBlack,
          fontSize: size,
          fontFamily: '.SF UI Display',
          fontWeight: weight),
    );
  }
}
