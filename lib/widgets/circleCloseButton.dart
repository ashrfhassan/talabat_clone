import 'package:flutter/material.dart';
import 'package:talabat_clone/style/colors.dart';
import 'package:talabat_clone/style/sizes.dart';

class CircleCloseButton extends StatelessWidget {
  const CircleCloseButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 0),
        padding: EdgeInsets.all(7), // button padding
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        iconColor: Theme.of(context).colorScheme.onSurface,
        shape: CircleBorder(),
        side: BorderSide(
          color: light_grey_color,
          width: 0.7,
        ),
      ),
      onPressed: onPressed,
      child: Icon(Icons.close, size: mediumSize),
    );
  }
}
