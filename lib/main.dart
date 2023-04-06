import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Made for FlexColorScheme version 7.0.0. Make sure you
      // use same or higher package version, but still same major version.
      // If you use a lower version, some properties may not be supported.
      // In that case remove them after copying this theme to your app.
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xffffa384),
          primaryContainer: Color(0xffff7d51),
          secondary: Color(0xff000000),
          secondaryContainer: Color(0xffffffff),
          tertiary: Color(0xffefe7bc),
          tertiaryContainer: Color(0xffe5d893),
          appBarColor: Color(0xffffffff),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          useFlutterDefaults: true,
          useTextTheme: true,
          defaultRadius: 20.0,
          textButtonRadius: 5.0,
          filledButtonRadius: 5.0,
          elevatedButtonRadius: 5.0,
          outlinedButtonRadius: 5.0,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          keepPrimary: true,
          keepSecondary: true,
          keepTertiary: true,
          keepPrimaryContainer: true,
          keepSecondaryContainer: true,
          keepTertiaryContainer: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9fc9ff),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xffffb59d),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xff86d2e1),
          tertiaryContainer: Color(0xff004e59),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          useFlutterDefaults: true,
          useTextTheme: true,
          defaultRadius: 20.0,
          textButtonRadius: 5.0,
          filledButtonRadius: 5.0,
          elevatedButtonRadius: 5.0,
          outlinedButtonRadius: 5.0,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // If you do not have a themeMode switch, uncomment this line
      // to let the device system mode control the theme mode:
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Learn Flow Back-office"),
        ),
        body: const Center(
          child: Text("Learn Flow"),
        ),
      ),
    );
  }
}
