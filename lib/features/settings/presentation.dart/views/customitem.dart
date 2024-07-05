import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customitem extends StatelessWidget {
  final String description;
  final String value;
  const customitem({super.key, required this.description, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff2BA4C8), width: 0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            style: TextStyle(
                fontSize:
                    MediaQuery.of(context).size.width > 950 ? 12.5 : 12.5),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
            
              value,
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width > 950 ? 12.5 : 12.5),
            ),
          ),
        ],
      ),
    );
  }
}
