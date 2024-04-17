import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:ghhg/features/reciept/presentaion/view/addrecieptwithscafold.dart';
import 'package:ghhg/features/reciept/presentaion/view/customtablerecieptitem.dart';

import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commn/navigation.dart';
import 'allreciepts.dart';

class customtablereciepts extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablereciepts(this.width);

  @override
  State<customtablereciepts> createState() => _customtablerecieptsState();
}

class _customtablerecieptsState extends State<customtablereciepts> {
  initscroll() async {
    BlocProvider.of<recieptCubit>(context).queryParameters = null;

    await BlocProvider.of<recieptCubit>(context)
        .getallreciepts(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<recieptCubit>(context)
            .getallmorereciepts(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<recieptCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "صرف" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<recieptCubit, recieptState>(
                  listener: (context, state) {
            if (state is showrecieptfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
          }, builder: (context, state) {
            if (state is showrecieptloadin) return loading();
            if (state is showrecieptfailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<recieptCubit>(context)
                                  .myreciepts!
                                  .length
                          ? loading()
                          : GestureDetector(
                              onTap: () {
                                BlocProvider.of<recieptCubit>(context)
                                        .reciepts =
                                    BlocProvider.of<recieptCubit>(context)
                                        .myreciepts[index]
                                        .receipts!;
                                navigateandfinish(
                                    navigationscreen: allreciepts(),
                                    context: context);
                              },
                              child: customtablerecieptitem(
                                textStyle: Appstyles.gettabletextstyle(
                                    context: context),
                                tenantname:
                                    BlocProvider.of<recieptCubit>(context)
                                        .myreciepts[index]
                                        .tenant!,
                                ownername:
                                    BlocProvider.of<recieptCubit>(context)
                                        .myreciepts[index]
                                        .ownerName!,
                                aqaradress:
                                    BlocProvider.of<recieptCubit>(context)
                                        .myreciepts[index]
                                        .realStateAddress!,
                                amountofmoney:
                                    BlocProvider.of<recieptCubit>(context)
                                        .myreciepts[index]
                                        .contractTotal
                                        .toString(),
                                addreciept: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<recieptCubit>(context)
                                              .id =
                                          BlocProvider.of<recieptCubit>(context)
                                              .myreciepts[index]
                                              .id!
                                              .toInt();
                                      if (MediaQuery.sizeOf(context).width <=
                                          950) {
                                        BlocProvider.of<recieptCubit>(context)
                                            .giverecieptdata(
                                                BlocProvider.of<recieptCubit>(
                                                        context)
                                                    .myreciepts[index]);
                                        navigateandfinish(
                                            context: context,
                                            navigationscreen:
                                                addrecieptwithscafold());
                                      } else {
                                        BlocProvider.of<recieptCubit>(context)
                                            .giverecieptdata(
                                                BlocProvider.of<recieptCubit>(
                                                        context)
                                                    .myreciepts[index]);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add_box_outlined,
                                      size: 24,
                                    )),
                              ),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<recieptCubit>(context).loading == true
                            ? BlocProvider.of<recieptCubit>(context)
                                    .myreciepts
                                    .length +
                                1
                            : BlocProvider.of<recieptCubit>(context)
                                .myreciepts
                                .length));
          }))
        ]));
  }
}
