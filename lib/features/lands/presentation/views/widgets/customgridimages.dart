import 'dart:io';

import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class customgridimagesland extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<addlandcuibt, addlandstate>(builder: (context, state) {
      return GridView.builder(
          itemCount: BlocProvider.of<addlandcuibt>(context).imageFile.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Stack(children: [
              Image.file(
                File(BlocProvider.of<addlandcuibt>(context)
                    .imageFile[index]
                    .path),
                fit: BoxFit.cover,
              ),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<addlandcuibt>(context).removeimage(index);
                  },
                  icon: Icon(Icons.cancel))
            ]);
          });
    });
  }
}
