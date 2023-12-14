import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  VoidCallback onTap;
  String? title;

  CustomButton({
    super.key,
    required this.icon,
    required this.color,
    this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
