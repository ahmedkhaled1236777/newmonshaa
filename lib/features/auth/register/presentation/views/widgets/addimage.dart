import 'package:ghhg/features/auth/login/presentation/views/widgets/customimage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class addimage extends StatelessWidget {
  final double radius;
  void Function()? onPressed;
  final String image;

  addimage(
      {super.key, required this.radius, this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CircleAvatar(
            radius: radius,
            child: customimage(width: 300, height: 300, imagename: image),
          ),
          IconButton(onPressed: onPressed, icon: const Icon(Icons.camera_alt))
        ],
      ),
    );
  }
}
