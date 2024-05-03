import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:ghhg/core/commn/widgets/customshoosedate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class clientsearch extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        phone.clear();
        BlocProvider.of<clientsCubit>(context).status = null;
        BlocProvider.of<DateCubit>(context).date5 = "تاريخ المعاينه";
        showDialog(
          context: context,

          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              title: Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<clientsCubit>(context).cleardata();
                      BlocProvider.of<DateCubit>(context).cleardates();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close)),
              ),
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width > 950
                              ? MediaQuery.sizeOf(context).width * 0.25
                              : MediaQuery.sizeOf(context).width * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  const Text('بحث بواسطة',
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          color: Color(0xff2ba4c8),
                                          fontWeight: FontWeight.w100),
                                      textAlign: TextAlign.right),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  custommytextform(
                                      controller: phone,
                                      hintText: "رقم الهاتف"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BlocBuilder<clientsCubit, clientsState>(
                                    builder: (context, state) {
                                      return dropdownbutton(
                                          onchanged: (val) {
                                            BlocProvider.of<clientsCubit>(
                                                    context)
                                                .changestatus(val);
                                          },
                                          items: [
                                            "انتظار",
                                            "معاينه",
                                            "معاينه مقبوله",
                                            "معاينه مرفوضه",
                                          ],
                                          name: BlocProvider.of<clientsCubit>(
                                                  context)
                                              .status,
                                          hint: "الحاله");
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BlocBuilder<DateCubit, DateState>(
                                    builder: (context, state) {
                                      return choosedatecontract(
                                        date:
                                            BlocProvider.of<DateCubit>(context)
                                                .date5,
                                        onPressed: () {
                                          BlocProvider.of<DateCubit>(context)
                                              .changedate5(context);
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  custommaterialbutton(
                                      onPressed: () async {
                                        BlocProvider.of<clientsCubit>(context)
                                            .queryParameters = {
                                          "phone": phone.text,
                                          "inspection_date":
                                              BlocProvider.of<DateCubit>(
                                                              context)
                                                          .date5 ==
                                                      "تاريخ المعاينه"
                                                  ? null
                                                  : BlocProvider.of<DateCubit>(
                                                          context)
                                                      .date5,
                                          "status": clientstatussrequest[
                                              BlocProvider.of<clientsCubit>(
                                                      context)
                                                  .status],
                                        };
                                        BlocProvider.of<DateCubit>(context)
                                            .cleardates();
                                        phone.clear();
                                        BlocProvider.of<clientsCubit>(context)
                                            .status = null;
                                        Navigator.pop(context);
                                        await BlocProvider.of<clientsCubit>(
                                                context)
                                            .getallclientss(
                                                token: generaltoken, page: 1);
                                      },
                                      button_name: "بحث",
                                      buttonicon: Icons.search)
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Icon(
        Icons.search,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
