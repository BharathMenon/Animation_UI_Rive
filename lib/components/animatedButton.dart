import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  final RiveAnimationController _btnanimationController;
  final VoidCallback press;
  const AnimatedButton({
    super.key,
    required RiveAnimationController btnanimationController,
    required this.press,
  }) : _btnanimationController = btnanimationController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(children: [
        SizedBox(
          height: 64,
          width: 260,
          child: RiveAnimation.asset(
            "assets/RiveAssets/button.riv",
            controllers: [_btnanimationController],
          ),
        ),
        const Positioned.fill(
          top: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.arrow_right),
              SizedBox(
                width: 8,
              ),
              Text(
                "Start the course",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
