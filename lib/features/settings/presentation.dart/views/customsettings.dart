import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/features/auth/login/presentation/views/login.dart';
import 'package:ghhg/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:ghhg/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:ghhg/core/commn/sound.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/settings/presentation.dart/views/customitem.dart';
import 'package:ghhg/features/settings/presentation.dart/views/customitemwithicon.dart';
import 'package:ghhg/features/settings/presentation.dart/views/updatepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customsettings extends StatelessWidget {
  final double width;
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  customsettings({super.key, required this.width});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          key: scafoldstate,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                scafoldstate.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'الاعدادات',
              style: TextStyle(color: Colors.white, fontSize: 14.2),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff415769),
          ),
          drawer: Dashboard(),
          body: Center(
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 69,
                        child: imagefromrequest(
                            border: 100,
                            url: cashhelper.getdata(key: "logo"),
                            height: 200,
                            width: 200),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text('الاعدادات',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w100),
                          textAlign: TextAlign.right),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    customitem(
                        description: "اسم الشركه",
                        value: cashhelper.getdata(key: "company_name")),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "عنوان الشركه",
                        value: cashhelper.getdata(key: "company_adress")),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "هاتف الشركه",
                        value: cashhelper.getdata(key: "company_phone")),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "الاسم",
                        value: cashhelper.getdata(key: "name")),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "الهاتف",
                        value: cashhelper.getdata(key: "phone")),
                    SizedBox(
                      height: 10,
                    ),
                    if (cashhelper.getdata(key: "role") == "manager")
                      customitemwithicon(
                        description: 'تعديل الحساب',
                        value: IconButton(
                            onPressed: () {
                              navigateandfinish(
                                  navigationscreen: updatepage(),
                                  context: context);
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.deepOrange,
                            )),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    customitemwithicon(
                        description: 'تسجيل الخروج',
                        value: BlocConsumer<LogoutCubit, LogoutState>(
                          listener: (context, state) {
                            if (state is Logoutsuccess) {
                              sound.playsound();
                              BlocProvider.of<HomeCubit>(context).cleardata();

                              cashhelper.cleardata();
                              showsnack(
                                  comment: "تم تسجيل الخروج بنجاح",
                                  context: context);
                              navigateandfinish(
                                  navigationscreen: Login(), context: context);
                            }
                            if (state is Logoutfailure) {
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                            }
                          },
                          builder: (context, state) {
                            if (state is loginloading) return loading();
                            return IconButton(
                                onPressed: () {
                                  BlocProvider.of<LogoutCubit>(context).log_out(
                                      token: cashhelper.getdata(key: "token"),
                                      devicetoken: cashhelper.getdata(
                                              key: "devicetoken") ??
                                          "");
                                },
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  size: 20,
                                  color: Colors.deepOrange,
                                ));
                          },
                        ))
                  ],
                ),
              )),
            ),
          )),
    );
  }
}
