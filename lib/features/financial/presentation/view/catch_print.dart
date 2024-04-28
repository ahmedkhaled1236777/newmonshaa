import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../data/model/financialmodel/receipt.dart';

class PdfViewCatch extends StatelessWidget {
  final Receipt data;
  var titles;
  PdfViewCatch({super.key, this.titles, required this.data});

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
        build: (format) => generateEMSPDF(format, 'منشاءة', data),
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}

Future<Uint8List> generateEMSPDF(
    PdfPageFormat format, String title, Receipt data) async {
  final pdf = pw.Document();
  final ttf = await rootBundle.load("fonts/static/Alexandria-Regular.ttf");
  final font = pw.Font.ttf(ttf);

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context content) {
        return pw.Container(
            width: double.infinity,
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Center(
                    child: pw.Text('سند قبض',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 11,
                            fontWeight: pw.FontWeight.bold),
                        textDirection: pw.TextDirection.rtl,
                        textAlign: pw.TextAlign.center),
                  ),
                  pw.SizedBox(height: 30),
                  pw.Text('إنه في يوم ${data.transactionDate} ',
                      style: pw.TextStyle(font: font, fontSize: 9),
                      textDirection: pw.TextDirection.rtl),
                  pw.SizedBox(height: 15),
                  pw.Text(
                      'تم استلام مبلغ وقدره ${data.totalAmount} جنيه مصرى من قبل  ${data.tenantName} بدلا عن ايجار شقة سكنيه عنوانها ${data.state!.addressDetails} عمارة رقم ${data.state!.buildingNumber!} شقة رقم ${data.state!.apartmentNumber}  وللمدة الزمنية من ${data.contractDateFrom}  الي  ${data.contractDateTo}',
                      style: pw.TextStyle(
                          font: font, lineSpacing: 5.0, fontSize: 9),
                      textDirection: pw.TextDirection.rtl),
                  pw.SizedBox(height: 25),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Column(children: [
                          pw.Text('المالك',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                          pw.SizedBox(height: 5),
                          pw.Text(data.owner!.name!,
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                        pw.Column(children: [
                          pw.Text('المستلم (الموظف)',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                          pw.SizedBox(height: 5),
                        ]),
                        pw.Column(children: [
                          pw.Text('المستاجر',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                          pw.SizedBox(height: 5),
                        ]),
                      ]),
                ]));
      }));

  return pdf.save();
}

Future<void> savePdfFile(String fileName, Uint8List byteList) async {
  final output = await getTemporaryDirectory();
  var filePath = "${output.path}/$fileName.pdf";
  final file = File(filePath);
  await file.writeAsBytes(byteList);
  await OpenFile.open(filePath);
}
