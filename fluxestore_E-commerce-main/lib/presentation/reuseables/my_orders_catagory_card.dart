import 'package:flutter/material.dart';

import '../../models/tab_catagory_model.dart';

class CategoryCard extends StatelessWidget {
  final TabCategoryModel category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(true);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: category.isSelected
                    ? const Color(0xff43484B)
                    : Colors.white),
            child: Center(
              child: Text(category.title,
                  style: TextStyle(
                      color:
                          category.isSelected ? Colors.white : Colors.black)),
            )),
      ),
    );
  }
}