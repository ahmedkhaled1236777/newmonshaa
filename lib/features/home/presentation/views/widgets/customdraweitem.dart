import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class customdraweritem extends StatelessWidget {
  final GlobalKey<ScaffoldState> mykey;

  final IconData iconData;
  final String text;
  final int count;
  final void Function() onTap;
  final double iconsize;
  final TextStyle textstyle;
  final double sizedboxwidth;
  const customdraweritem(
      {super.key,
      required this.mykey,
      required this.iconData,
      required this.count,
      required this.sizedboxwidth,
      required this.textstyle,
      required this.text,
      required this.onTap,
      required this.iconsize});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: iconsize,
            ),
            SizedBox(
              width: sizedboxwidth,
            ),
            Text(
              text,
              style: textstyle,
            ),
            Spacer(),
            if (count > 0)
              Container(
                constraints: BoxConstraints(maxWidth: 30),
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                height: 20,
                child: Center(
                    child: Text(
                  count.toString(),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
              )
          ],
        ));
  }
}
