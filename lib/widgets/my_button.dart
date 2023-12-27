import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final void Function()? onTap;
  final Widget? child;

  MyButton({super.key,required this.onTap,required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
          padding: EdgeInsets.symmetric(horizontal: 26,vertical: 18),
          child: child
      ),
    );
  }
}
