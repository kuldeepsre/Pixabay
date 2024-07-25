import 'package:flutter/material.dart';

class CircleTab extends StatelessWidget {
  final bool isSelected;
  final String data;
  // final dynamic iconSize;
  final dynamic icon;
  const CircleTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.data,
    //  required this.iconSize
  });

  @override
  Widget build(BuildContext context) {
    Color nameColor =
        isSelected ? Colors.black87 : const Color.fromARGB(255, 157, 157, 157);
    Color bgcolor = isSelected
        ? const Color.fromARGB(255, 35, 38, 47)
        : const Color.fromARGB(255, 243, 243, 243);
    Color iconColor = isSelected
        ? const Color.fromARGB(255, 182, 182, 182)
        : const Color.fromARGB(255, 157, 157, 157);

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: bgcolor,
          radius: 20,
          child: Center(
            child: Icon(icon, size: 18, color: iconColor),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 10,
            color: nameColor),
        )
      ],
    );
  }
}