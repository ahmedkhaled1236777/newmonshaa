import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/features/lands/data/models/showlands/datum.dart';

import 'package:flutter/material.dart';

class mlandShowEstate extends StatefulWidget {
  final Datum data;

  const mlandShowEstate({super.key, required this.data});
  @override
  State<StatefulWidget> createState() {
    return ShowlandEstateState();
  }
}

class ShowlandEstateState extends State<mlandShowEstate> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          key: scafoldstate,
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.white,
            ),
            title: const Text(
              'بيانات الارض',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1100) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                            child: Form(
                                child: ListView(
                              shrinkWrap: true,
                              children: [
                                const Text(
                                  'تفاصيل الاعلان',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 20, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${widget.data!.address!} - ${widget.data!.addressDetails}",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.merge_type,
                                              size: 20, color: Colors.blueGrey),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              '${widget.data.sizeInMetres} متر',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.blueGrey))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "سعر المتر : ${widget.data.priceOfOneMeter.toString()}",
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "التكلفه الكليه : ${widget.data.totalCost.toString()}",
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'نوع المعلن : ${showland[widget.data.advertiserType]}',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'كود الاعلان : ',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      Text(
                                        widget.data.id.toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'التاريخ : ',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      Text(
                                        widget.data.createdAt.toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                        if(! cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden") )          Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone_android_sharp,
                                          size: 20, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.data.sellerPhoneNumber
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                             if(! cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden") )     const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Text(
                                    "اسم المالك او الوسيط : ${widget.data.sellerName!}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 12.5,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Text(
                                    "اسم الموظف : ${widget.data.user!.name!}",
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        height: 2,
                                        fontSize: 12.5,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                if (widget.data.advertiseDetails != null)
                                  Container(
                                    child: Text(
                                      "تفاصيل الارض : ${widget.data.advertiseDetails!}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          height: 2,
                                          fontSize: 12.5,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                              ],
                            )),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Container(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: double.infinity,
                              child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.4,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                children: widget.data.landImages!
                                    .map((e) => imagefromrequest(
                                        border: 0,
                                        url: e,
                                        height: 200,
                                        width: 200))
                                    .toList(),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                          )),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                            child: Form(
                                child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'تفاصيل الاعلان',
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,
                                            size: 20, color: Colors.blueGrey),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${widget.data!.address!} - ${widget.data!.addressDetails}",
                                            maxLines: 10,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.merge_type,
                                                size: 20,
                                                color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                '${widget.data.sizeInMetres} متر',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.blueGrey))
                                          ],
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "سعر المتر : ${widget.data.priceOfOneMeter.toString()}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "التكلفه الكليه : ${widget.data.totalCost.toString()}",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          ' نوع المعلن : ${showland[widget.data.advertiserType]}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'كود الاعلان : ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Text(
                                          widget.data.id.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'التاريخ: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Text(
                                          widget.data.createdAt.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                 if(! cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden") )   Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.phone_android_sharp,
                                            size: 20, color: Colors.blueGrey),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          widget.data.sellerPhoneNumber
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                 if(! cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden") )   const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      "اسم المالك او الوسيط : ${widget.data.sellerName!}",
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          height: 2,
                                          fontSize: 12,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      "اسم الموظف : ${widget.data.user!.name!}",
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          height: 2,
                                          fontSize: 12,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  if (widget.data.advertiseDetails != null)
                                    Container(
                                      child: Text(
                                        "تفاصيل الارض : ${widget.data.advertiseDetails!}",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            height: 2,
                                            fontSize: 12,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                ],
                              ),
                            )),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          alignment: Alignment.center,
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => imagefromrequest(
                                  border: 0,
                                  url: widget.data.landImages![index],
                                  height: 200,
                                  width: 200),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 5,
                                  ),
                              itemCount: widget.data.landImages!.length)),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
