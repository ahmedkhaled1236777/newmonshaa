import 'package:ghhg/core/color/appcolors.dart';
import 'package:flutter/material.dart';

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Appcolors.maincolor,
      ),
    );
  }
}
