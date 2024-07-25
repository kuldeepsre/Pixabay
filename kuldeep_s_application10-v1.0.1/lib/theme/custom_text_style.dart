import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/utils/size_utils.dart';
import 'package:kuldeep_s_application10/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray90002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumGray90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimary13 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimary_1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumSwitzerOnPrimary =>
      theme.textTheme.bodyMedium!.switzer.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumSwitzerWhiteA700 =>
      theme.textTheme.bodyMedium!.switzer.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );
  static get bodySmallWorkSansGray600 =>
      theme.textTheme.bodySmall!.workSans.copyWith(
        color: appTheme.gray600,
      );
  // Display text style
  static get displayMediumGray90002 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.gray90002,
      );
  // Headline text style
  static get headlineMediumAcme =>
      theme.textTheme.headlineMedium!.acme.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineMediumGray90002 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get headlineSmallGray90002 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray90002,
      );
  // Label text style
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  // Title text style
  static get titleLargeGray90002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get titleMediumGray90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
        fontSize: 18.fSize,
      );
  static get titleMediumGray90002_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleMediumGray90002_2 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );
  static get titleSmallGray90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallWorkSans => theme.textTheme.titleSmall!.workSans;
  static get titleSmallWorkSansGray90002 =>
      theme.textTheme.titleSmall!.workSans.copyWith(
        color: appTheme.gray90002,
      );
}

extension on TextStyle {
  TextStyle get switzer {
    return copyWith(
      fontFamily: 'Switzer',
    );
  }

  TextStyle get workSans {
    return copyWith(
      fontFamily: 'Work Sans',
    );
  }

  TextStyle get acme {
    return copyWith(
      fontFamily: 'Acme',
    );
  }

  TextStyle get airbnbCerealApp {
    return copyWith(
      fontFamily: 'Airbnb Cereal App',
    );
  }
}
