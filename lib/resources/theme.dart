import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get theme {
    var typography = Typography.material2021(platform: defaultTargetPlatform);
    var textTheme = typography.black.apply(
      fontFamily: 'Poppins',
      bodyColor: Colors.black,
      displayColor: Colors.black,
    );

    var headlineMedium = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 35 / 24,
      color: Colors.black,
      letterSpacing: 0,
    );

    var headlineSmall = const TextStyle(
      fontSize: 22,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      height: 46 / 22,
      color: Colors.black,
      letterSpacing: 0,
      fontStyle: FontStyle.normal,
    );

    var titleLarge = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      height: 28 / 20,
      color: Colors.black,
      letterSpacing: 0,
    );

    var titleMedium = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.black,
      height: 22 / 14,
      letterSpacing: 0,
    );

    var titleSmall = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      height: 21 / 14,
      color: Colors.black.withOpacity(0.5),
      letterSpacing: 0,
    );

    var bodyLarge = const TextStyle(
      fontSize: 14,
      height: 22 / 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Figtree',
      letterSpacing: 0,
      color: Colors.black,
    );

    var bodyMedium = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      height: 20 / 13,
      color: Colors.black,
      letterSpacing: 0,
    );

    var bodySmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      height: 18 / 12,
      letterSpacing: 0,
      color: Colors.black.withOpacity(0.7),
    );

    var labelSmall = const TextStyle(
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 20 / 12,
      color: Colors.black,
      letterSpacing: 0,
    );

    textTheme = textTheme.copyWith(
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelSmall: labelSmall,
    );

    var border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );

    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColor,
        onSecondary: Colors.white,
        brightness: Brightness.light,
        background: Colors.white,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: primaryColor.withOpacity(0.3),
        selectionHandleColor: primaryColor,
      ),
      primaryColor: primaryColor,
      indicatorColor: primaryColor,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: MyColors.backgroundColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      typography: typography,
      cardTheme: CardTheme(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: MyColors.greenShade1,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: MyColors.greenShade1,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: titleLarge.copyWith(color: Colors.white),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(16),
        buttonColor: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: titleMedium,
          fixedSize: const Size(double.maxFinite, 50),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: EdgeInsets.zero,
          textStyle: headlineSmall.copyWith(fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(width: 1, color: primaryColor),
          textStyle: titleMedium.copyWith(color: MyColors.primaryColor),
          fixedSize: const Size(double.maxFinite, 50),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          // side: const BorderSide(color: MyColors.divider, width: 1),
        ),
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        iconSize: 25,
        elevation: 0,
        disabledElevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        hintStyle: titleSmall.copyWith(color: Colors.black.withOpacity(0.5)),
        labelStyle: bodySmall,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 24),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        space: 1,
        // color: MyColors.divider,
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(width: 1, color: Color(0x45000000)),
        ),
        checkColor: MaterialStateProperty.all(Colors.black),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return const Color(0xFFFFFFFF);
        }),
        overlayColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
      ),
      radioTheme: RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          } else {
            return const Color(0xFFB5B5B5);
          }
        }),
      ).copyWith(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MyColors.primaryColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MyColors.primaryColor;
          }
          return null;
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: MyColors.card,
        disabledColor: Colors.grey,
        selectedColor: primaryColor,
        secondarySelectedColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        labelStyle: bodyLarge.copyWith(height: 1.2, color: Colors.black),
        secondaryLabelStyle: bodyLarge.copyWith(
          height: 1.2,
          color: Colors.white,
        ),
        brightness: Brightness.dark,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryColor,
        activeTickMarkColor: primaryColor,
        thumbColor: primaryColor,
        inactiveTrackColor: primaryColor.withOpacity(.2),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        // labelColor: MyColors.accentColor3,
        unselectedLabelColor: Colors.black.withOpacity(0.7),
        labelStyle: titleLarge.copyWith(
          fontWeight: FontWeight.w700,
          // color: MyColors.accentColor3,
          // fontSize: 14,
        ),
        unselectedLabelStyle: bodySmall.copyWith(
          fontWeight: FontWeight.w400,
          // fontSize: 14,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyColors.greenShade2,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedLabelStyle: textTheme.bodyMedium,
          unselectedLabelStyle: textTheme.bodySmall,
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24)),
    );
  }

  static Color primaryColor = MyColors.primaryColor;
}
