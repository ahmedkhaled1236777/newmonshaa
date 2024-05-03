import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../data/models/contractmodel/datum.dart';

class PdfViewContract extends StatelessWidget {
  final Datum data;
  PdfViewContract({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Text(
          'منشاءة',
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
    PdfPageFormat format, String title, Datum data) async {
  final pdf = pw.Document();
  final ttf = await rootBundle.load("fonts/static/Alexandria-Regular.ttf");
  final font = pw.Font.ttf(ttf);

  pdf.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context) => [
      pw.Partitions(children: [
        pw.Partition(
            child: pw.Container(
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
              pw.Center(
                child: pw.Text('عقد ايجار',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold),
                    textDirection: pw.TextDirection.rtl,
                    textAlign: pw.TextAlign.center),
              ),
              pw.SizedBox(height: 30),
              pw.Text(
                  'إنه في يوم ........................ الموافق ${data.contractDate} ',
                  style: pw.TextStyle(font: font, fontSize: 9),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('تحرر بين كل من :',
                  style: pw.TextStyle(font: font, fontSize: 9),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text(
                  'أولاً: السيد/ ${data.ownerName}   المقيم/ ${data.ownerCardAddress}   ويحمل رقم قومي / ${data.ownerCardNumber} (طرف اول مؤجر)',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text(
                  'ثانيا: السيد/ ${data.tenant!.name}   المقيم/ ${data.tenant!.cardAddress}  ويحمل رقم قومي / ${data.tenant!.cardNumber} (طرف ثان مستاجر)',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text(
                  'وبعد أن أقر الطرفين بأهليتهم القانونية لإبرام التصرفات القانونية والتعاقد اتفقا على ما يلي',
                  style: pw.TextStyle(font: font, fontSize: 9),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('1- البند الاول ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'بموجب هذا العقد قد أجر الطرف الأول للطرف الثاني ما هو ............................................ بقصد استعماله ....................................... الكائنة فى ${data.realStateAddress} - ${data.realStateAddressDetails} ',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('2- البند الثانى ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'مدة هذا العقد تبدأ من ${data.contractDateFrom} وتنتهي في ${data.contractDateTo} وينتهي هذا العقد بنهاية مدته دون حاجة إلى تنبيه أو إنذار أو إجراءات أخرى، ولا يجدد هذا العقد ولا يمتد لأى مدة جديدة إلا بعقد واتفاق جديدين.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('3- البند الثالث ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'الأجرة المتفق عليها هي مبلغ ومقداره ${data.contractTotal} جنيها مصريا شهرياً يدفعها المستأجر مقدماً أول كل شهر ليد المؤجر بالإيصال اللازم ولا تبرأ ذمة المستأجر من دين الأجرة إلا بموجب ذلك الإيصال، على أن تزيد في كل سنة تالية بما قيمته   % من القيمة الإيجارية في نهاية هذه السنة.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('4- البند الرابع ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'تقاضى الطرف الأول تأميناً مبلغ ومقداره ${data.insuranceTotal} جنيها مصريا يرد هذا المبلغ للطرف الثاني المستأجر في نهاية مدة العقد إن كان له وجه حق فيه.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('5- البند الخامس ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'إذا تأخر المستأجر عن دفع الإيجار في الميعاد المحدد يعتبر هذا العقد مفسوخاً من تلقاء نفسه دون الحاجة إلى تنبيه أو إنذار أو إعذار وبدون الحصول على حكم قضائي، كما يحق للطرف الأول طرده مع إلزامه بدفع ما تأخر في سداده مع التعويضات إن كان لها وجه حق.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('6- البند السادس ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'لا يجوز للمستأجر أن يؤجر العين المؤجرة من الباطن، أو يتنازل عنها للغير عن أى مدة كانت أو إحداث أى تغيير بالعين بدون إذن كتابى من المؤجر، كما يلتزم المستأجر بالمحافظة على العين المؤجرة ويراعيها كما يراعى المالك ملكه الخاص، وإذا خالف المستأجر ذلك يعتبر العقد مفسوخاً من تلقاء نفسه دون الحاجة إلى تنبيه أو إنذار ودون الحصول على حكم قضائى',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('7- البند السابع ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'لا يجوز للمستأجر أن يستغلا العين المؤجرة لغير الغرض المؤجرة من أجله وهو السكن والمعيشة، وفى حالة الإخلال بهذا البند يصبح هذا العقد مفسوخاً من تلقاء نفسه دون الحاجة إلى تنبيه أو إنذار ودون الحصول على حكم قضائى.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('8- البند الثامن ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'جميع ما ينفقه المستأجر على العين المؤجرة بعد استلامها من دهانات أو لصق ورق أو ديكور وخلافه لا يلزم المؤجر بشيء منها ولا يحق للمستأجر أن يطلب قيمة ما أنفقه قضاءً أو رضاءً.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('9- البند التاسع ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'يلتزم المستأجر بعمل الترميمات الضرورية للعين المؤجرة الناجمة عن الاستعمال، وذلك طوال مدة الإيجار.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 20),
              pw.Text('10- البند العاشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'يلتزم المستأجر برد العين المؤجرة للطرف الأول عند انتهاء مدة التعاقد، وذلك بالحالة التي عليها وقت التعاقد دون أى إتلافات ويتحمل المستأجر كافة النفقات إذا حدث للعين تلفيات ترجع إلى خطأ المستأجر.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('11- البند الحادى عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'لا يحق للطرف الثانى المماطلة أو المنازعة في تسليم العين المؤجرة للطرف الأول عند انتهاء مدة العقد لأى سبب من الأسباب، ويعتبر وضع يده دون عقد جديد بعد انتهاء المدة الواردة بالبند الثانى من هذا العقد، وضع يد غاصب ويحق للطرف الأول طرده منها بكافة الوسائل ومنها استصدار حكم بالطرد.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('12- البند الثانى عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'إذا حدث أمر مخل بالعين المؤجرة يكون هذا العقد مفسوخاً من تلقاء نفسه دون الحاجة إلى تنبيه أو إنذار ودون الحصول على حكم قضائى.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('13- البند الثالث عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'يلتزم المستأجر بدفع قيمة فواتير المياه والكهرباء والغاز طوال المدة الإيجارية، وفى حالة عدم سدادهم تأخذ حكم الأجرة ويحق للطرف الأول توقيع الحجز على المنقولات الموجودة بالعين المؤجرة استيفاء للمبالغ المطلوبة، كما يحق للطرف الأول مطالبة الطرف الثانى بهذه المبالغ بكافة الطرق القانونية المشروعة.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('12- البند الرابع عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'إذا رغب الطرف الثانى في إنهاء هذا العقد قبل نهاية مدته فعليه التنبيه على الطرف الأول بذلك قبل رغبته في ذلك بشهر على الأقل، بإنذار على يد محضر وإلا كان ملزماً بأجرة شهر كامل بعد تركه العين المؤجرة.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('15- البند الخامس عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'يقر أطراف هذا التعاقد بأن جميع العناوين الواردة قرين كل طرف هي عناوين صحيحة، وأنه في حالة توجيه ثمة مراسلات أو إخطارات أو إنذارات قانونية أو قضائية أو خطابات موصى عليها بعلم الوصول على تلك العناوين فهي صحيحة ونافذة ومقبولة من أطراف هذا التعاقد، وأنه في حالة تغيير أياً من العناوين الواردة فيلتزم من قام بتغيير عنوانه أن يخطر الطرف الآخر بالعنوان الجديد والصحيح، وإلا صارت الإخطارات والمكاتبات والمراسلات والإنذارات والإعلانات صحيحة ونافذة في حق من تم إعلانه بها وقانونية.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('16- البند السادس عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  'تختص محكمة                                                                    الابتدائيه وجزئياتها بالنظر فيما ينشأ من منازعات او خلافه حول بنود العقد وقد تحرر هذا العقد من نسختين بيد كل الطرفين نسخه للعمل بموجبها.',
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 12),
              pw.Text('17- البند السابع عشر ',
                  style: pw.TextStyle(
                      font: font, fontSize: 9, fontWeight: pw.FontWeight.bold),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 8),
              pw.Text(
                  "بند اضافي : ........................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................ ",
                  style:
                      pw.TextStyle(font: font, fontSize: 9, lineSpacing: 3.0),
                  textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 35),
              pw.SizedBox(height: 25),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text('الطرف الثانى المستاجر',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                          pw.SizedBox(
                            height: 35,
                          ),
                          pw.Text('شاهد ثاني',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                    pw.Text('',
                        style: pw.TextStyle(font: font),
                        textDirection: pw.TextDirection.rtl),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text('الطرف الاول المؤجر',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                          pw.SizedBox(
                            height: 35,
                          ),
                          pw.Text('شاهد اول',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                  ]),
            ])))
      ])
    ],
  ));

  return pdf.save();
}

Future<void> savePdfFile(String fileName, Uint8List byteList) async {
  final output = await getTemporaryDirectory();
  var filePath = "${output.path}/$fileName.pdf";
  final file = File(filePath);
  await file.writeAsBytes(byteList);
  await OpenFile.open(filePath);
}
