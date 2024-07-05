import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/datum.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/prinyaqar.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
class mShowEstate extends StatefulWidget {
  final Datum data;
                                
   mShowEstate({super.key, required this.data});
  @override
  State<StatefulWidget> createState() {
    return ShowEstateState();
  }
}

class ShowEstateState extends State<mShowEstate> {
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
              'بيانات العقار',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 950) {
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: const Text(
                                        'تفاصيل الاعلان',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                   BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                                          listener: (context, state) {
if(state is sharedimagessuccess)                  saveaqarPdfFile("تفاصيل العقار", widget.data,images: BlocProvider.of<ShowaqaratCubit>(context).sharedimages);
                                          },
                                          builder: (context, state) {
                                            if(state is sharedimagesloading)return SizedBox(height: 25,width: 25,child: loading());
                                            return  IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () async {
                              if(widget.data.realStateImages!=null){
                                BlocProvider.of<ShowaqaratCubit>(context).getsharedimages(dataimages:widget.data.realStateImages!);

                              } 
                              else{
 saveaqarPdfFile("تفاصيل العقار", widget.data,images:null);
                              }               
                                                                                         
                                                                                    //   navigateto(navigationscreen: PdfViewaqar(data: widget.data,), context: context);
                                            
                                            }, icon: Icon(Icons.share,color: Appcolors.maincolor,));
                                          }
                                        ),
                                         BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                                          listener: (context, state) async {
 if(state is imagessuccess){
                                             await Share.shareXFiles(BlocProvider.of<ShowaqaratCubit>(context).images,text: "${ show[widget.data.realStateType!]} \n العنوان :  ${widget.data.realStateAddress}- ${widget.data.realStateAddressDetails} \n مساحة العقار : ${widget.data.realStateSpace} \n عدد الغرف : ${widget.data.numberOfRooms}\n عدد الحمامات : ${widget.data.numberOfBathrooms} \n التفاصيل : ${widget.data.advertiseDetails}",subject: "jgjh");

                                            }                                          },
                                          builder: (context, state) {
                                            if(state is imagesloading)return SizedBox(height: 25,width: 25,child: loading());
                                            return  IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () async {
                             
                                  if(widget.data.realStateImages!.isNotEmpty)    {      BlocProvider.of<ShowaqaratCubit>(context).getimages(dataimages: widget.data.realStateImages!);}
                                  else{
                                    print("lllllllllllllllllllllllllllllllllllllllll");
                  await Share.share(  "${ show[widget.data.realStateType!]} \n العنوان :  ${widget.data.realStateAddress}- ${widget.data.realStateAddressDetails} \n مساحة العقار : ${widget.data.realStateSpace} \n عدد الغرف : ${widget.data.numberOfRooms}\n عدد الحمامات : ${widget.data.numberOfBathrooms} \n التفاصيل : ${widget.data.advertiseDetails}",subject: "");

                                  }
                                                                             
                                                                               
                                                                                    /*   List images=[];
                                              if(widget.data.realStateImages!=null){
                                             for (var element in widget.data.realStateImages!) {
                                               images.add( await networkImage(element)
                                             );
                                             }
                                              }
                                                                                //   navigateto(navigationscreen: PdfViewaqar(data: widget.data,), context: context);
                                                                         saveaqarPdfFile("تفاصيل العقار", widget.data,images: images);*/
                                             
                                                                                 }, icon:  FaIcon(FontAwesomeIcons.facebook,color: Appcolors.maincolor,));
                                           
               } )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (widget.data.compoundName != null)
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "اسم الكمبوند : ",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Text(
                                          widget.data.compoundName,
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.data.compoundName != null)
                                  const SizedBox(
                                    height: 15,
                                  ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.home,
                                          size: 20, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        show[widget.data.realStateType!],
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
                                      Icon(Icons.location_on_outlined,
                                          size: 20, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${widget.data!.realStateAddress!} - ${widget.data!.realStateAddressDetails!}",
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
                                              '${widget.data.realStateSpace} متر',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.blueGrey))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      if (show[widget.data.realStateType!] !=
                                          "محل")
                                        Row(
                                          children: [
                                            Icon(Icons.bed_outlined,
                                                size: 20,
                                                color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                '${widget.data.numberOfRooms!}  غرفه',
                                                style: TextStyle(
                                                    fontSize: 12.5,
                                                    color: Colors.blueGrey))
                                          ],
                                        ),
                                      if (show[widget.data.realStateType!] !=
                                          "محل")
                                        SizedBox(
                                          width: 15,
                                        ),
                                      if (show[widget.data.realStateType!] !=
                                          "محل")
                                        Row(
                                          children: [
                                            if (widget.data.numberOfBathrooms !=
                                                null)
                                              Icon(Icons.bathtub_outlined,
                                                  size: 20,
                                                  color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            if (widget.data.numberOfBathrooms !=
                                                null)
                                              Text(
                                                  '${widget.data.numberOfBathrooms!} حمام',
                                                  style: TextStyle(
                                                      fontSize: 12.5,
                                                      color: Colors.blueGrey))
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                if (show[widget.data.realStateType!] != "محل")
                                  const SizedBox(
                                    height: 15,
                                  ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "رقم العماره : ${widget.data.buildingNumber.toString()}",
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
                                if (show[widget.data.realStateType!] != "محل")
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "رقم الشقه : ${widget.data.apartmentNumber}",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (show[widget.data.realStateType!] != "محل")
                                  SizedBox(
                                    height: 15,
                                  ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "السعر : ${widget.data.realStatePrice.toString()}",
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
                                        'نوع المعلن:${show[widget.data.advertiserType]}',
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
                                        'كود الاعلان: ',
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
                                        'التاريخ: ',
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
                        key: "permessions").contains("owner_phone_hidden")     )       Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "رقم هاتف المالك او الوسيط",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.data.advertisedPhoneNumber
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
                        key: "permessions").contains("owner_phone_hidden") )  const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Text(
                                    "اسم المالك او الوسيط : ${widget.data.advertiserName}",
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
                                SizedBox(
                                  height: 15,
                                ),
                                if (widget.data.advertiseDetails != null)
                                  Container(
                                    child: Text(
                                      "تفاصيل العقار : ${widget.data.advertiseDetails!}",
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
                                children: widget.data.realStateImages!
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              child: Form(
                                  child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'تفاصيل الاعلان',
                                            style: TextStyle(
                                                fontSize: 12.5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                         
                                        BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                                          listener: (context, state) {
if(state is sharedimagessuccess)                  saveaqarPdfFile("تفاصيل العقار", widget.data,images: BlocProvider.of<ShowaqaratCubit>(context).sharedimages);
                                          },
                                          builder: (context, state) {
                                            return  IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () async {
                              if(widget.data.realStateImages!=null){
                                BlocProvider.of<ShowaqaratCubit>(context).getsharedimages(dataimages:widget.data.realStateImages!);

                              } 
                              else{
 saveaqarPdfFile("تفاصيل العقار", widget.data,images:null);
                              }               
                                                                                         
                                                                                    //   navigateto(navigationscreen: PdfViewaqar(data: widget.data,), context: context);
                                            
                                            }, icon: Icon(Icons.share,color: Appcolors.maincolor,));
                                          }
                                        ),
                                         BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                                          listener: (context, state) async {
 if(state is imagessuccess){
                                             await Share.shareXFiles(BlocProvider.of<ShowaqaratCubit>(context).images,text: "${ show[widget.data.realStateType!]} \n العنوان :  ${widget.data.realStateAddress}- ${widget.data.realStateAddressDetails} \n مساحة العقار : ${widget.data.realStateSpace} \n عدد الغرف : ${widget.data.numberOfRooms}\n عدد الحمامات : ${widget.data.numberOfBathrooms} \n التفاصيل : ${widget.data.advertiseDetails}",subject: "jgjh");

                                            }                                          },
                                          builder: (context, state) {
                                            if(state is imagesloading)return SizedBox(height: 25,width: 25,child: loading());
                                            return  IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () async {
                             
                                  if(widget.data.realStateImages!.isNotEmpty)    {      BlocProvider.of<ShowaqaratCubit>(context).getimages(dataimages: widget.data.realStateImages!);}
                                  else{
                  await Share.share(  "${ show[widget.data.realStateType!]} \n العنوان :  ${widget.data.realStateAddress}- ${widget.data.realStateAddressDetails} \n مساحة العقار : ${widget.data.realStateSpace} \n عدد الغرف : ${widget.data.numberOfRooms}\n عدد الحمامات : ${widget.data.numberOfBathrooms} \n التفاصيل : ${widget.data.advertiseDetails}",subject: "jgjh");

                                  }
                                                                             
                                                                               
                                                                                    /*   List images=[];
                                              if(widget.data.realStateImages!=null){
                                             for (var element in widget.data.realStateImages!) {
                                               images.add( await networkImage(element)
                                             );
                                             }
                                              }
                                                                                //   navigateto(navigationscreen: PdfViewaqar(data: widget.data,), context: context);
                                                                         saveaqarPdfFile("تفاصيل العقار", widget.data,images: images);*/
                                             
                                                                                 }, icon:  FaIcon(FontAwesomeIcons.facebook,color: Appcolors.maincolor,));
                                           
                                         })
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    if (widget.data.compoundName != null)
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "اسم الكمبوند : ",
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                            Text(
                                              widget.data.compoundName,
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget.data.compoundName != null)
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.home,
                                              size: 20, color: Colors.blueGrey),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            show[widget.data.realStateType!],
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
                                          Icon(Icons.location_on_outlined,
                                              size: 20, color: Colors.blueGrey),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${widget.data!.realStateAddress!} - ${widget.data!.realStateAddressDetails!}",
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
                                                  '${widget.data.realStateSpace} متر',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.blueGrey))
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          if (show[
                                                  widget.data.realStateType!] !=
                                              "محل")
                                            Row(
                                              children: [
                                                Icon(Icons.bed_outlined,
                                                    size: 20,
                                                    color: Colors.blueGrey),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    '${widget.data.numberOfRooms!}  غرفه',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blueGrey))
                                              ],
                                            ),
                                          if (show[
                                                  widget.data.realStateType!] !=
                                              "محل")
                                            SizedBox(
                                              width: 15,
                                            ),
                                          if (show[
                                                  widget.data.realStateType!] !=
                                              "محل")
                                            Row(
                                              children: [
                                                if (widget.data
                                                        .numberOfBathrooms !=
                                                    null)
                                                  Icon(Icons.bathtub_outlined,
                                                      size: 20,
                                                      color: Colors.blueGrey),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                if (widget.data
                                                        .numberOfBathrooms !=
                                                    null)
                                                  Text(
                                                      '${widget.data.numberOfBathrooms!} حمام',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.blueGrey))
                                              ],
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
                                            "رقم العماره : ${widget.data.buildingNumber.toString()}",
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
                                    if (show[widget.data.realStateType!] !=
                                        "محل")
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "رقم الشقه : ${widget.data.apartmentNumber}",
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (show[widget.data.realStateType!] !=
                                        "محل")
                                      SizedBox(
                                        height: 15,
                                      ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "السعر : ${widget.data.realStatePrice.toString()}",
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
                                            'نوع المعلن:${show[widget.data.advertiserType]}',
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
                                            'كود الاعلان: ',
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
                        key: "permessions").contains("owner_phone_hidden")     )    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "رقم هاتف المالك او الوسيط",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w100),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            widget.data.advertisedPhoneNumber
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
                        key: "permessions").contains("owner_phone_hidden")     )     const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: Text(
                                        "اسم المالك او الوسيط : ${widget.data.advertiserName!}",
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
                                          "تفاصيل العقار : ${widget.data.advertiseDetails!}",
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
                                itemBuilder: (context, index) =>
                                    imagefromrequest(
                                        border: 0,
                                        url:
                                            widget.data.realStateImages![index],
                                        height: 200,
                                        width: 200),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 5,
                                    ),
                                itemCount:
                                    widget.data.realStateImages!.length)),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}

