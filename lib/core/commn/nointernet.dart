import 'package:flutter/material.dart';

class nointernet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
              "images/nointernet.png",
              width: MediaQuery.sizeOf(context).width * 0.5,
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              "! برجاء الاتصال بالانترنت",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
