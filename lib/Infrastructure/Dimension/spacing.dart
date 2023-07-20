import 'package:flutter/material.dart';

import 'dimension.dart';

class Space extends StatelessWidget {
  final double width;
  final double height;
  final bool isVspace;

  Space(this.width, this.height, this.isVspace);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}

/// Add vertical space
/// Type : xs, sm, med, lg, xl.
class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(0, size, true);

  static VSpace get xs => VSpace(Dimension.spacing_micro);
  static VSpace get sm => VSpace(Dimension.spacing_tiny);
  static VSpace get med => VSpace(Dimension.spacing_x_small);
  static VSpace get lg => VSpace(Dimension.spacing_small);
  static VSpace get xl => VSpace(Dimension.spacing_semi);
  static VSpace get lg24 => VSpace(Dimension.spacing_standard);
  static VSpace get xl48 => VSpace(Dimension.spacing_large);

  ///New VSpace
  static VSpace get spacing_micro => VSpace(Dimension.spacing_micro);
  static VSpace get spacing_tiny => VSpace(Dimension.spacing_tiny);
  static VSpace get spacing_small => VSpace(Dimension.spacing_small);
  static VSpace get spacing_x_small => VSpace(Dimension.spacing_x_small);
  static VSpace get spacing_xx_small => VSpace(Dimension.spacing_xx_small);
  static VSpace get spacing_standard => VSpace(Dimension.spacing_standard);
  static VSpace get spacing_standard_extended =>
      VSpace(Dimension.spacing_standard_extended);
  static VSpace get spacing_semi => VSpace(Dimension.spacing_semi);
  static VSpace get spacing_large => VSpace(Dimension.spacing_large);
  static VSpace get spacing_x_large => VSpace(Dimension.spacing_x_large);
  static VSpace get spacing_xx_large => VSpace(Dimension.spacing_xx_large);

  ///Design System component spacing.
  static VSpace get formInput => VSpace(Dimension.spacing_small);
  static VSpace get formBottomButton => VSpace(Dimension.spacing_small);
}

/// Add horizontal space
/// Type : xs, sm, med, lg, xl.
class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(size, 0, false);

  /// New HSpace
  static HSpace get spacing_micro => HSpace(Dimension.spacing_micro);
  static HSpace get spacing_tiny => HSpace(Dimension.spacing_tiny);
  static HSpace get spacing_small => HSpace(Dimension.spacing_small);
  static HSpace get spacing_standard => HSpace(Dimension.spacing_standard);
  static HSpace get spacing_semi => HSpace(Dimension.spacing_semi);
  static HSpace get spacing_large => HSpace(Dimension.spacing_large);
  static HSpace get spacing_x_small => HSpace(Dimension.spacing_x_small);
  static HSpace get spacing_xx_small => HSpace(Dimension.spacing_xx_small);
  static HSpace get spacing_x_large => HSpace(Dimension.spacing_x_large);
  static HSpace get spacing_xx_large => HSpace(Dimension.spacing_xx_large);
}
