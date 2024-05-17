import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    super.key, required this.name, required this.onPressed, required this.color
  });
  final String name;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
