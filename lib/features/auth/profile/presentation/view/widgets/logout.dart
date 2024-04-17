import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:ghhg/features/auth/profile/presentation/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class logoutpro extends StatelessWidget {
  final void Function() onPressed;

  const logoutpro({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      padding: EdgeInsets.only(right: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Appcolors.maincolor,
          borderRadius: BorderRadius.circular(Appsizes.size10)),
      child: Align(
        alignment: Alignment.centerRight,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocConsumer<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  if (state is Logoutfailure)
                    showsnack(comment: state.error_message, context: context);
                  else if (state is Logoutsuccess) {
                    showsnack(comment: state.success_message, context: context);
                  }
                },
                builder: (context, state) {
                  if (state is Logoutloading) return loading();
                  return IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        Icons.logout,
                        color: Appcolors.whitecolor,
                      ));
                },
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3,
              ),
              customtext(text: "تسجيل الخروج")
            ],
          ),
        ),
      ),
    );
  }
}
