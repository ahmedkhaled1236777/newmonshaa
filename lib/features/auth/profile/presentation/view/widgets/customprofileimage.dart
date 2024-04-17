import 'package:ghhg/features/auth/login/presentation/views/widgets/customimage.dart';
import 'package:flutter/material.dart';

class customprofileimage extends StatelessWidget {
  final String imagename;

  const customprofileimage({super.key, required this.imagename});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).height * 0.1,
      child:
          customimage(width: 100, height: 100, imagename: "images/person.png"),
    );
  }
}
