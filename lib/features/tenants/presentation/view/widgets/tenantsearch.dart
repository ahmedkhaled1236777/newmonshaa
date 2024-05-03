import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class tenantsearch extends StatelessWidget {
  final TextEditingController phone = TextEditingController();
  final TextEditingController cardnumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        phone.clear();
        cardnumber.clear();
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
                                      hintText: "رقم هاتف المستاجر"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  custommytextform(
                                      controller: cardnumber,
                                      hintText: "بطاقة المستاجر"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  custommaterialbutton(
                                      onPressed: () async {
                                        BlocProvider.of<TenantCubit>(context)
                                            .queryParameters = {
                                          "phone": phone.text,
                                          "card_number": cardnumber.text
                                        };

                                        phone.clear();
                                        cardnumber.clear();
                                        Navigator.pop(context);
                                        await BlocProvider.of<TenantCubit>(
                                                context)
                                            .getalltenants(
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
