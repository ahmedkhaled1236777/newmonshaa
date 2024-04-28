import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/aqarat/data/repos/addaqar/addaqarimplementation.dart';
import 'package:ghhg/features/aqarat/data/repos/editaqar/editaqarrepoimplementation.dart';
import 'package:ghhg/features/aqarat/data/repos/showaqar/showaqarrepoimplementation.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/features/auth/login/data/repos/loginrepo/loginrepoimplementation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghhg/features/auth/login/presentation/views/login.dart';
import 'package:ghhg/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';
import 'package:ghhg/features/auth/profile/data/repo/profilerepoimplementation.dart';
import 'package:ghhg/features/auth/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:ghhg/features/auth/register/data/repos/registerrepoimplementation.dart';
import 'package:ghhg/features/auth/register/presentation/viewsmodel/registercuibt/registercuibt.dart';
import 'package:ghhg/features/clients/data/repos/clientrepoimplementation.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:ghhg/features/employeecomission/data/repos/employeecomrepoimp.dart';
import 'package:ghhg/features/employeecomission/presentation/view/employeecom.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecocuibt.dart';
import 'package:ghhg/features/technical%20support/data/repo/connectrepoimp.dart';
import 'package:ghhg/features/technical%20support/presentation/viewmodel/connect/connectcuibt.dart';
import 'package:ghhg/features/contracts/data/repos/contractrepoimplementation.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/emoloyees/data/repos/addemployeerepoimplementation.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:ghhg/features/expenses.dart/data/repos/expenserepoimplementation.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:ghhg/features/financial/data/repos/financialrepoimplementation.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:ghhg/features/finishedcontracts/data/repos/finishedcontractsrepoimplementation.dart';
import 'package:ghhg/features/finishedcontracts/presentation/viewmodel/finishedcontracts/finishedcontracts_cubit.dart';
import 'package:ghhg/features/home/data/repos/homerepoimplementation.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/lands/data/repos/addland/addlandrepoimplementation.dart';
import 'package:ghhg/features/lands/data/repos/editland/editlandrepoimplementation.dart';
import 'package:ghhg/features/lands/data/repos/showland/showlandrepoimplementation.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:ghhg/features/notifications/data/repos/notificationrepoimplementation.dart';
import 'package:ghhg/features/notifications/presentations/viewmodel/notifications/notifications_cubit.dart';
import 'package:ghhg/features/reciept/data/repos/recieptrepoimplementation.dart';
import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/data/repos/aqaratrepoimplementationreports.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/viewmodel/aqaratreports/aqaratreports_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/data/repos/landsreportsrepoimplementation.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/viewmodel/landsreports/landsreports_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/data/repos/moneyreportsrepoimplementation.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/viewmodel/expenses/expenswsreports_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/data/repo/profitrepoimp.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/viewmodel/cubit/profit_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/data/repo/revenusreportsrepoimplementation.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/viewmodel/revenus/revenusreports_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/data/repos/contractsreportsimp.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/viewmodel/contracts/contractsreport_cubit.dart';
import 'package:ghhg/features/reports/presentation/viewmodel/cubit/reports_cubit.dart';
import 'package:ghhg/features/revenus/data/repos/revenurepoimplementation.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/splash/splash.dart';
import 'package:ghhg/features/tenants/data/repo/tenantrepoimplementation.dart';
import 'package:ghhg/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:ghhg/firebase_options.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cashhelper.initcashhelper();
 
// Replace with actual values
    if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,

    );
     AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/sss',
      [
        NotificationChannel(
            channelKey: 'newas',  
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ]);

  }
/*

 bitsdojo_window: ^0.1.6
  device_screen_size: ^0.0.2*/
/*Size screenSize = WidgetsBinding.instance.window.physicalSize;
double width = screenSize.width;
double height = screenSize.height;
doWhenWindowReady(() {
    appWindow.minSize = Size(width,height);
    appWindow.size = Size(width,height); 
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });*/
  Apiservice.initdio();

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              logincuibt(loginrepo: login_repo_implementation()),
        ),
        BlocProvider(
          create: (context) => financialCubit(financialrepoimplementation()),
        ),
        BlocProvider(
            create: (context) =>
                registercuibt(registerrepo: registerrepoimplementation())),
        BlocProvider(
            create: (context) => recieptCubit(recieptrepoimplementation())),
        BlocProvider(
            create: (context) =>
                EditCubit(editrepo: editaqarrepoimplementation())),
        BlocProvider(
            create: (context) => TenantCubit(tenantrepoimplementation())),
        BlocProvider(
            create: (context) => NotificationsCubit(
                notificationsrepo: notificationrepoimplementation())),
        BlocProvider(
            create: (context) =>
                EditlandCubit(editrepo: editlandrepoimplementation())),
        BlocProvider(
            create: (context) =>
                AqaratreportsCubit(showaqqarrepoimplementationreports())),
        BlocProvider(
            create: (context) =>
                employeecomCubit(employeecomrepoimplementation())),
        BlocProvider(
            create: (context) =>
                moneyatreportsCubit(showmoneyrepoimplementationreports())),
        BlocProvider(
            create: (context) =>
                revenusatreportsCubit(showrevenusrepoimplementationreports())),
        BlocProvider(
            create: (context) =>
                landatreportsCubit(showlandrepoimplementationreports())),
        BlocProvider(
            create: (context) => ProfileCubit(profilerepoimplementation())),
        BlocProvider(create: (context) => HomeCubit(homerepoimplementation())),
        BlocProvider(
            create: (context) =>
                addaqarcuibt(addaqarrepo: addaqarimplementation())),
        BlocProvider(create: (context) => DateCubit()),
        BlocProvider(create: (context) => DatelandCubit()),
        BlocProvider(
            create: (context) =>
                ShowaqaratCubit(showaqar: showaqqarrepoimplementation())),
        BlocProvider(
            create: (context) =>
                AddemployeeCubit(addemployeerepo: emplyeerepoimplementaion())),
        BlocProvider(create: (context) => ReportsCubit()),
        BlocProvider(
            create: (context) =>
                showemployeescuibt(employeerepo: emplyeerepoimplementaion())),
        BlocProvider(
            create: (context) =>
                ShowaqaratCubit(showaqar: showaqqarrepoimplementation())),
        BlocProvider(
            create: (context) => connectCubit(connectrepoimplementation())),
        BlocProvider(
            create: (context) =>
                profitatreportsCubit(showprofitrepoimplementationreports())),
        BlocProvider(
            create: (context) =>
                addlandcuibt(addlandrepo: addlandrepoimplementation())),
        BlocProvider(
            create: (context) =>
                ShowlandsCubit(showlands: showlandsrepoimplementation())),
        BlocProvider(
            create: (context) => contractsatreportsCubit(
                showcontractsrepoimplementationreports())),
        BlocProvider(
            create: (context) => contractCubit(contractrepoimplementation())),
        BlocProvider(
            create: (context) => expenseCubit(expenserepoimplementation())),
        BlocProvider(
            create: (context) => revenueCubit(revenuerepoimplementation())),
        BlocProvider(
            create: (context) => clientsCubit(clientsrepoimplementation())),
        BlocProvider(
            create: (context) =>
                finishedcontractsCubit(finishedconreactsrepoimplementation())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(),
              scaffoldBackgroundColor: Colors.white,
              dialogBackgroundColor: Colors.white,
              datePickerTheme: DatePickerThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0)))),
              dialogTheme: DialogTheme(
                  insetPadding: MediaQuery.sizeOf(context).width < 950
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 20)
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              fontFamily: 'Alexandria',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate, // Here !
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              MonthYearPickerLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'), // Arabic

              Locale('en'), // English
            ],
            home:
                LogoAnimationScreen() /*cashhelper.getdata(key: "token") == null
                ? Login()
                : MyHomePage()*/

            /* Contract(
                tenantname: TextEditingController(),
                tenanphone: TextEditingController(),
                tenantcard: TextEditingController(),
                tenantadress: TextEditingController(),
                tenantjob: TextEditingController(),
                tenantnationality: TextEditingController(),
                ownername: TextEditingController(),
                ownerphone: TextEditingController(),
                ownercard: TextEditingController(),
                owneradress: TextEditingController(),
                ownerjob: TextEditingController(),
                ownernationality: TextEditingController(),
                aqaradress: TextEditingController(),
                aqaradressdetails: TextEditingController(),
                aqarmohafza: TextEditingController(),
                aqartype: TextEditingController(),
                area: TextEditingController(),
                emaranumber: TextEditingController(),
                housenumber: TextEditingController(),
                totalvalue: TextEditingController(),
                insuranceval: TextEditingController(),
                commessionvalue: TextEditingController(),
                periodofdelay: TextEditingController())*/
            ),
      ),
    );
  }
  //kjkj
}
