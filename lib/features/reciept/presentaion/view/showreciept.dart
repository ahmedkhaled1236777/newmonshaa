import 'package:flutter/material.dart';

import '../../data/models/allrecieptmodel/receipt.dart';

class showreciept extends StatelessWidget {
  final Receipt myreciept;

  const showreciept({super.key, required this.myreciept});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      content: SingleChildScrollView(
          child: Container(
        width: MediaQuery.sizeOf(context).width > 950
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                'بيانات القسط',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'اسم المستأجر:  ${myreciept.tenant!.name}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'رقم هاتف المستأجر: ${myreciept.tenant!.phone}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'اسم المالك:  ${myreciept.ownerName}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'رقم هاتف المالك: ${myreciept.ownerPhone}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'قيمة القسط : ${myreciept.totalAmount}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'قيمة العموله : ${myreciept.commission}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'الايجار من : ${myreciept.contractDateFrom}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'الايجار الي : ${myreciept.contractDateTo}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff2BA4C8), width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'اسم الموظف : ${myreciept.user!.name}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12.5, color: Colors.black87),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
