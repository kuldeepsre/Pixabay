import 'package:flutter/material.dart';

class Formatters {
  Color getColorName(String color) {
    switch (color.toLowerCase()) {
      case 'black':
        return const Color(0xFF000000);
      case 'white':
        return const Color(0xFFFFFFFF);
      case 'orange':
        return const Color(0xFFFFA500);
      case 'pink':
        return const Color(0xFFFFC0CB);
      case 'green':
        return const Color(0xFFAED581); // Soft green color
      case 'peach':
        return const Color(0xFFFFE0B2); // Soft peach color
      case 'blue':
        return const Color(0xFF81D4FA); // Soft blue color
      case 'red':
        return const Color(0xFFFF8A80); // Soft red color
      case 'yellow':
        return const Color(0xFFFFFF8D); // Soft yellow color
      case 'purple':
        return const Color(0xFFCE93D8); // Soft purple color
      case 'cyan':
        return const Color(0xFF80DEEA); // Soft cyan color
      case 'teal':
        return const Color(0xFF80CBC4); // Soft teal color
      case 'amber':
        return const Color(0xFFFFD54F); // Soft amber color
      case 'lime':
        return const Color(0xFFDCE775); // Soft lime color
      case 'indigo':
        return const Color(0xFF9FA8DA); // Soft indigo color
      case 'brown':
        return const Color(0xFFBCAAA4); // Soft brown color
      case 'grey':
        return const Color(0xFFE0E0E0); // Soft grey color
      case 'deeporange':
        return const Color(0xFFFFAB91); // Soft deep orange color
      case 'deeppurple':
        return const Color(0xFFB39DDB); // Soft deep purple color
      case 'lightblue':
        return const Color(0xFF81D4FA); // Soft light blue color
      case 'lightgreen':
        return const Color(0xFFAED581); // Soft light green color
      default:
        return const Color(0xFF9E9E9E); // Default value for unknown colors
    }
  }

  Color getColorNameWithoutCode(String color) {
  switch (color.toLowerCase()) {
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'orange':
      return Colors.orangeAccent;
    case 'pink':
      return Colors.pink;
    case 'green':
      return Colors.lightGreen.shade300; // Soft green color
    case 'peach':
      return Colors.orangeAccent.shade100; // Soft peach color
    case 'blue':
      return Colors.lightBlue.shade300; // Soft blue color
    case 'red':
      return Colors.redAccent.shade100; // Soft red color
    case 'yellow':
      return Colors.yellow.shade300; // Soft yellow color
    case 'purple':
      return Colors.purple.shade300; // Soft purple color
    case 'cyan':
      return Colors.cyan.shade300; // Soft cyan color
    case 'teal':
      return Colors.teal.shade300; // Soft teal color
    case 'amber':
      return Colors.amber.shade300; // Soft amber color
    case 'lime':
      return Colors.lime.shade300; // Soft lime color
    case 'indigo':
      return Colors.indigo.shade300; // Soft indigo color
    case 'brown':
      return Colors.brown.shade300; // Soft brown color
    case 'grey':
      return Colors.grey.shade300; // Soft grey color
    case 'deeporange':
      return Colors.deepOrange.shade300; // Soft deep orange color
    case 'deeppurple':
      return Colors.deepPurple.shade300; // Soft deep purple color
    case 'lightblue':
      return Colors.lightBlue.shade300; // Soft light blue color
    case 'lightgreen':
      return Colors.lightGreen.shade300; // Soft light green color
    default:
      return Colors.grey; // Default value for unknown colors
  }
}
}
