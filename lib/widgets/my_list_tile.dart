import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final void Function()? onTap;
  MyListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text.toString()),
        onTap: onTap,
      ),
    );
  }
}
