import 'package:ghhg/core/color/appcolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class imagefromrequest extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  double border;
  imagefromrequest(
      {this.border = 30,
      super.key,
      required this.url,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: CachedNetworkImage(
          fit: BoxFit.fill,
          height: height,
          width: width,
          imageUrl: url,
          placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Appcolors.maincolor,
              )),
          errorWidget: (context, url, error) => Icon(Icons.error)),
    );
  }
}
