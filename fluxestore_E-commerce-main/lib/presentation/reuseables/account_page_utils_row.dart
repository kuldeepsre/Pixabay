import 'package:flutter/material.dart';

class AccountPageUtilsRow extends StatelessWidget {
  final dynamic icon;
  final String text;
  final double size;
  final Function()? onTap;
  const AccountPageUtilsRow(
      {super.key, required this.icon, required this.text, required this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: size,
                    color: const Color(0xffB1B5C3),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(text,
                      style: const TextStyle(
                          color: Color(0xff33302E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400))
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
