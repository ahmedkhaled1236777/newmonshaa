import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/auth/profile/presentation/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customdescription extends StatelessWidget {
  final String description;
  final String value;
  double? height;
  bool firstfshape;
  customdescription(
      {super.key,
      required this.description,
      required this.value,
      this.height,
      this.firstfshape = true});
  @override
  Widget build(BuildContext context) {
    return firstfshape == true
        ? Container(
            height: MediaQuery.sizeOf(context).height * 0.06,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Appcolors.maincolor,
                borderRadius: BorderRadius.circular(Appsizes.size10)),
            child: Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(children: [
                      customtext(
                        text: value,
                        textStyle15: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: MediaQuery.sizeOf(context).width > 950
                                ? 3.sp
                                : MediaQuery.sizeOf(context).width > 600
                                    ? 7.sp
                                    : 10.sp),
                      ),
                      customtext(
                        text: "  :  ",
                      ),
                      customtext(
                          text: description,
                          textStyle15: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: MediaQuery.sizeOf(context).width > 950
                                  ? 3.sp
                                  : MediaQuery.sizeOf(context).width > 600
                                      ? 7.sp
                                      : 10.sp)),
                      const SizedBox(
                        width: Appsizes.size15,
                      )
                    ]))))
        : Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            height: MediaQuery.sizeOf(context).height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Appcolors.maincolor,
                borderRadius: BorderRadius.circular(Appsizes.size10)),
            child: customtext(
              text: value,
              textStyle15: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.sizeOf(context).width > 950
                      ? 3.sp
                      : MediaQuery.sizeOf(context).width > 600
                          ? 7.sp
                          : 10.sp),
            ));
  }
}
