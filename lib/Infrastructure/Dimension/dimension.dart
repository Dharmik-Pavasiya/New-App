class Dimension {
  static double scale = 1;
  static double offsetScale = 1;

  static double get spacing_micro => 4 * scale;
  //[Tiny]: <p>, Between two text, LC_ListHelpComponent
  static double get spacing_tiny => 8 * scale;
  //[XXSmall]:
  static double get spacing_xx_small => 10 * scale;
  //[XSmall]: Between header & subheading
  static double get spacing_x_small => 12 * scale;
  //[Small]: Between form controls LC_PageContainer[Web]
  static double get spacing_small => 16 * scale;
  //[Standard]: LC_PageContainer[MOB]
  static double get spacing_standard => 24 * scale;

  static double get spacing_standard_extended => 28 * scale;
  //[Semi]: Title Spacing [Web]
  static double get spacing_semi => 32 * scale;
  //[Large]: Between widget [LoginWeb]
  static double get spacing_large => 48 * scale;
  //[XLarge]:
  static double get spacing_x_large => 64 * scale;
  static double get spacing_xx_large => 82 * scale;
}
