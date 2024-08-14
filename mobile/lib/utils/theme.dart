import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279177503),
      surfaceTint: Color(4284243310),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281217088),
      onPrimaryContainer: Color(4290690770),
      secondary: Color(4284374629),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293190379),
      onSecondaryContainer: Color(4282927183),
      tertiary: Color(4280028438),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282264630),
      onTertiaryContainer: Color(4292065478),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294768890),
      onSurface: Color(4280032029),
      onSurfaceVariant: Color(4282795596),
      outline: Color(4286019197),
      outlineVariant: Color(4291282380),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413681),
      inversePrimary: Color(4291085785),
      primaryFixed: Color(4292993526),
      onPrimaryFixed: Color(4279835433),
      primaryFixedDim: Color(4291085785),
      onPrimaryFixedVariant: Color(4282664534),
      secondaryFixed: Color(4293124586),
      onSecondaryFixed: Color(4279966497),
      secondaryFixedDim: Color(4291282382),
      onSecondaryFixedVariant: Color(4282795597),
      tertiaryFixed: Color(4294499305),
      onTertiaryFixed: Color(4280751904),
      tertiaryFixedDim: Color(4292591565),
      onTertiaryFixedVariant: Color(4283777356),
      surfaceDim: Color(4292663770),
      surfaceBright: Color(4294768890),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374388),
      surfaceContainer: Color(4294045166),
      surfaceContainerHigh: Color(4293650409),
      surfaceContainerHighest: Color(4293255651),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279177503),
      surfaceTint: Color(4284243310),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281217088),
      onPrimaryContainer: Color(4293717247),
      secondary: Color(4282532425),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285822076),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280028438),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282264630),
      onTertiaryContainer: Color(4294961138),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768890),
      onSurface: Color(4280032029),
      onSurfaceVariant: Color(4282532424),
      outline: Color(4284440165),
      outlineVariant: Color(4286282368),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413681),
      inversePrimary: Color(4291085785),
      primaryFixed: Color(4285690757),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284046188),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285822076),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284177251),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286934650),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285224545),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663770),
      surfaceBright: Color(4294768890),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374388),
      surfaceContainer: Color(4294045166),
      surfaceContainerHigh: Color(4293650409),
      surfaceContainerHighest: Color(4293255651),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279177503),
      surfaceTint: Color(4284243310),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281217088),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280361512),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282532425),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280028438),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282264630),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768890),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280492841),
      outline: Color(4282532424),
      outlineVariant: Color(4282532424),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413681),
      inversePrimary: Color(4293585663),
      primaryFixed: Color(4282401362),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280953915),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282532425),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281084979),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283514184),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281935666),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663770),
      surfaceBright: Color(4294768890),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374388),
      surfaceContainer: Color(4294045166),
      surfaceContainerHigh: Color(4293650409),
      surfaceContainerHighest: Color(4293255651),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291085785),
      surfaceTint: Color(4291085785),
      onPrimary: Color(4281151295),
      primaryContainer: Color(4279835434),
      onPrimaryContainer: Color(4289046201),
      secondary: Color(4291282382),
      onSecondary: Color(4281348151),
      secondaryContainer: Color(4282466632),
      onSecondaryContainer: Color(4292466656),
      tertiary: Color(4292591565),
      onTertiary: Color(4282198837),
      tertiaryContainer: Color(4280751905),
      onTertiaryContainer: Color(4290420909),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279440148),
      onSurface: Color(4293255651),
      onSurfaceVariant: Color(4291282380),
      outline: Color(4287729814),
      outlineVariant: Color(4282795596),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255651),
      inversePrimary: Color(4284243310),
      primaryFixed: Color(4292993526),
      onPrimaryFixed: Color(4279835433),
      primaryFixedDim: Color(4291085785),
      onPrimaryFixedVariant: Color(4282664534),
      secondaryFixed: Color(4293124586),
      onSecondaryFixed: Color(4279966497),
      secondaryFixedDim: Color(4291282382),
      onSecondaryFixedVariant: Color(4282795597),
      tertiaryFixed: Color(4294499305),
      onTertiaryFixed: Color(4280751904),
      tertiaryFixedDim: Color(4292591565),
      onTertiaryFixedVariant: Color(4283777356),
      surfaceDim: Color(4279440148),
      surfaceBright: Color(4282005818),
      surfaceContainerLowest: Color(4279111183),
      surfaceContainerLow: Color(4280032029),
      surfaceContainer: Color(4280295201),
      surfaceContainerHigh: Color(4280953387),
      surfaceContainerHighest: Color(4281676854),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291414493),
      surfaceTint: Color(4291085785),
      onPrimary: Color(4279440676),
      primaryContainer: Color(4287532962),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291545810),
      onSecondary: Color(4279571996),
      secondaryContainer: Color(4287729816),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292854737),
      onTertiary: Color(4280357147),
      tertiaryContainer: Color(4288907927),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440148),
      onSurface: Color(4294900475),
      onSurfaceVariant: Color(4291611345),
      outline: Color(4288914089),
      outlineVariant: Color(4286808713),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255651),
      inversePrimary: Color(4282730327),
      primaryFixed: Color(4292993526),
      onPrimaryFixed: Color(4279111710),
      primaryFixedDim: Color(4291085785),
      onPrimaryFixedVariant: Color(4281546053),
      secondaryFixed: Color(4293124586),
      onSecondaryFixed: Color(4279243031),
      secondaryFixedDim: Color(4291282382),
      onSecondaryFixedVariant: Color(4281677373),
      tertiaryFixed: Color(4294499305),
      onTertiaryFixed: Color(4279962646),
      tertiaryFixedDim: Color(4292591565),
      onTertiaryFixedVariant: Color(4282593595),
      surfaceDim: Color(4279440148),
      surfaceBright: Color(4282005818),
      surfaceContainerLowest: Color(4279111183),
      surfaceContainerLow: Color(4280032029),
      surfaceContainer: Color(4280295201),
      surfaceContainerHigh: Color(4280953387),
      surfaceContainerHighest: Color(4281676854),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834943),
      surfaceTint: Color(4291085785),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291414493),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834943),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291545810),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292854737),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440148),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294834943),
      outline: Color(4291611345),
      outlineVariant: Color(4291611345),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255651),
      inversePrimary: Color(4280756536),
      primaryFixed: Color(4293256698),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291414493),
      onPrimaryFixedVariant: Color(4279440676),
      secondaryFixed: Color(4293453551),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291545810),
      onSecondaryFixedVariant: Color(4279571996),
      tertiaryFixed: Color(4294762477),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292854737),
      onTertiaryFixedVariant: Color(4280357147),
      surfaceDim: Color(4279440148),
      surfaceBright: Color(4282005818),
      surfaceContainerLowest: Color(4279111183),
      surfaceContainerLow: Color(4280032029),
      surfaceContainer: Color(4280295201),
      surfaceContainerHigh: Color(4280953387),
      surfaceContainerHighest: Color(4281676854),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
