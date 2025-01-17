import 'package:flutter/cupertino.dart';

class PushWidget extends StatelessWidget {
  const PushWidget({
    super.key,
    required this.goTo,
    required this.child,
  });
  final Widget goTo;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => goTo),
          );
        },
        child: child);
  }
}
