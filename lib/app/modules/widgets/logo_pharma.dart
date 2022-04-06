import 'package:flutter/material.dart';
import 'package:pharma/app/theme/app_images.dart';

class LogoPharma extends StatelessWidget {
  final double width;
  final double height;
  const LogoPharma({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        AppImages.logoPharma,
      ),
    );
  }
}
