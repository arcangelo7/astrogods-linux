import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocalFlag extends StatelessWidget {
  final String countryCode;
  final double width;
  final double height;

  const LocalFlag({
    super.key,
    required this.countryCode,
    this.width = 20,
    this.height = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/flags/${countryCode.toLowerCase()}.svg',
      width: width,
      height: height,
    );
  }
}
