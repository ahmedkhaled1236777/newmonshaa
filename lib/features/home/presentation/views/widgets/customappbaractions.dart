import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;

class customappbaractions extends StatelessWidget {
  final void Function() onTapnotific;
  final void Function() onTapmessage;

  const customappbaractions(
      {super.key, required this.onTapnotific, required this.onTapmessage});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(children: [
          InkWell(
            onTap:
                BlocProvider.of<HomeCubit>(context).shownotifications == false
                    ? () {
                        showsnack(
                            comment: "ليس لديك صلاحية الوصول للرابط",
                            context: context);
                      }
                    : onTapnotific,
            child: badges.Badge(
              position: badges.BadgePosition.custom(top: -10, start: -5),
              badgeContent: Text(
                BlocProvider.of<HomeCubit>(context)
                    .sidebar[12]["count"]
                    .toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          InkWell(
            onTap: BlocProvider.of<HomeCubit>(context).showtechnicalsupport ==
                    false
                ? () {
                    showsnack(
                        comment: "ليس لديك صلاحية الوصول للرابط",
                        context: context);
                  }
                : onTapmessage,
            child: const Icon(
              Icons.message,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
        ]);
      },
    );
  }
}
