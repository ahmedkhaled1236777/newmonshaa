import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import '../../../data/models/showstate/datum.dart';

class PdfViewaqar extends StatelessWidget {
  final Datum data;
  var titles;
  PdfViewaqar({super.key, this.titles, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Text(
          'منشأه',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          width: 10,
        ),
      ]),
      body: PdfPreview(
        build: (format) => generateEMSPDF( 'منشاءة', data),
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}

Future<Uint8List> generateEMSPDF(
  String title, Datum data,{List ?images}) async {
  final pdf = pw.Document();
  final ttf = await rootBundle.load("fonts/static/Alexandria-Regular.ttf");
  final font = pw.Font.ttf(ttf);
List<pw.Widget>? pdfImages;
  if(images!=null){
  pdfImages = images!.map((image) {
      return pw.Padding(
          padding: pw.EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisSize: pw.MainAxisSize.max,
              children: [
              
                pw.Image(
                   image,
                    height: 400,
              
                    fit: pw.BoxFit.fill)
              ]));
    }).toList();};
pdf.addPage(pw.MultiPage(
        margin: pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
         pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Center(
                    child: pw.Text('تفاصيل العقار',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold),
                        textDirection: pw.TextDirection.rtl,
                        textAlign: pw.TextAlign.center),
                  ),
                  pw.SizedBox(height: 30),
                 
                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${ show[data.realStateType!]}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

pw.Text("  :  "),
                     pw.Text(
             "نوع العقار"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ])
               ,
               pw.SizedBox(height: 15),
                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${data.realStateAddress}-${data.realStateAddressDetails}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

pw.Text("  :  "),
                     pw.Text(
             "العنوان"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ])
               ,
                              pw.SizedBox(height: 15),

                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${data.realStateSpace}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

pw.Text("  :  "),
                     pw.Text(
             "المساحه"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ])
               ,
                              pw.SizedBox(height: 15),

                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${data.numberOfRooms}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

pw.Text("  :  "),
                     pw.Text(
             "عدد الغرف"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ])
               ,
                              pw.SizedBox(height: 15),

                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${data.numberOfBathrooms}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

pw.Text("  :  "),
                     pw.Text(
             "عدد الحمامات"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ])
               ,
                            
              
                              pw.SizedBox(height: 15),

                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${data.realStatePrice}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),
pw.Text("  :  "),
                     pw.Text(
             "السعر"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                       font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ]),
        if(data.advertiseDetails!=null)                      pw.SizedBox(height: 15),

                  if(data.advertiseDetails!=null)          pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                       pw.Text(
             "${data.advertiseDetails}"        , style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

                    pw.SizedBox(width: 10),
                     pw.Text(
             "التفاصيل"        , style: pw.TextStyle(
              color: PdfColor.fromInt(0xff415769),
                       font: font, lineSpacing: 5.0, fontSize: 12),
                      textDirection: pw.TextDirection.rtl),

  
                  ])
               ,]),
               pw.SizedBox(height: 20),
      if(pdfImages!=null)      pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisSize: pw.MainAxisSize.max,
                children: pdfImages),
          ];
        }));
  

  return pdf.save();
}

Future<void> saveaqarPdfFile(String fileName,Datum data,{List?images}) async {
 await Printing.sharePdf(bytes: await   generateEMSPDF( "title", data,images: images)
, filename: "${fileName}.pdf");

}
