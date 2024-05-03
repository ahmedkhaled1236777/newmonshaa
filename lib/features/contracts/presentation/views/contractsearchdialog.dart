import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class contractsearch extends StatelessWidget {
  final TextEditingController tenantphone = TextEditingController();
  final TextEditingController tenantcard = TextEditingController();
  final TextEditingController ownerphone = TextEditingController();
  final TextEditingController ownercard = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tenantcard.clear();
        tenantphone.clear();
        ownercard.clear();
        ownerphone.clear();
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
                                      controller: tenantphone,
                                      hintText: "رقم هاتف المستاجر"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  custommytextform(
                                      controller: tenantcard,
                                      hintText: "رقم بطاقة المستأجر"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  custommytextform(
                                      controller: ownerphone,
                                      hintText: "رقم هاتف المالك"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  custommytextform(
                                      controller: ownercard,
                                      hintText: "رقم بطاقة المالك"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  custommaterialbutton(
                                      onPressed: () async {
                                        BlocProvider.of<contractCubit>(context)
                                            .queryParameters = {
                                          "tenant_phone": tenantphone.text,
                                          "tenant_card_number": tenantcard.text,
                                          "owner_phone": ownerphone.text,
                                          "owner_card_number": ownercard.text
                                        };
                                        tenantcard.clear();
                                        tenantphone.clear();
                                        ownercard.clear();
                                        ownerphone.clear();
                                        Navigator.pop(context);

                                        await BlocProvider.of<contractCubit>(
                                                context)
                                            .getallcontracts(
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

  @override
  void dispose() {
    /* Discards any resources used by the object. After this is called,
    the object is not in a usable state and should be discarded
    (calls to addListener will throw after the object is disposed) */
    tenantcard.dispose();
    tenantphone.dispose();
    ownercard.dispose();
    ownerphone.dispose();
  }
}
