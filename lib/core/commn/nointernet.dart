import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:lottie/lottie.dart';

class nointernet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Lottie.asset("images/nointerneta.json")),
            SizedBox(
              height: 10,
            ),
            Text(
              "! برجاء الاتصال بالانترنت",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            if (insplash == true)
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    if (await Connectivity().checkConnectivity() !=
                        ConnectivityResult.none) {
                      await BlocProvider.of<HomeCubit>(context)
                          .gethome(token: generaltoken);
                      Navigator.pop(context);
                    }
                  }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
