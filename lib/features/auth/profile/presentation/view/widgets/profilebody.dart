import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:ghhg/features/auth/profile/presentation/view/widgets/customdescription.dart';
import 'package:ghhg/features/auth/profile/presentation/view/widgets/customprofileimage.dart';
import 'package:ghhg/features/auth/profile/presentation/view/widgets/logout.dart';
import 'package:ghhg/features/auth/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class profilebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = BlocProvider.of<ProfileCubit>(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.06,
              ),
              const customprofileimage(imagename: "images/people.png"),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                pro.profilemodel!.data!.name!,
                style: TextStyle(
                    fontSize: Appsizes.size15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alexandria"),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              customdescription(
                  description: "اسم الشركه",
                  value: pro.profilemodel!.data!.companyName!),
              SizedBox(
                height: height * 0.025,
              ),
              customdescription(
                  description: "العنوان",
                  value: pro.profilemodel!.data!.companyAddress!),
              SizedBox(
                height: height * 0.025,
              ),
              customdescription(
                  description: "رقم الهاتف",
                  value: pro.profilemodel!.data!.phone!),
              SizedBox(
                height: height * 0.025,
              ),
              customdescription(
                  description: "رقم هاتف الشركه",
                  value: pro.profilemodel!.data!.companyPhone!),
              SizedBox(
                height: height * 0.025,
              ),
              logoutpro(onPressed: () async {
                await BlocProvider.of<LogoutCubit>(context).log_out(
                    token: cashhelper.getdata(
                      key: "token",
                    ),
                    devicetoken: cashhelper.getdata(key: "devicetoken"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
