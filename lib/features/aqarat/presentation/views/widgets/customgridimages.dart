import 'dart:io';

import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class customgridimages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<addaqarcuibt, addaqarstate>(builder: (context, state) {
      return GridView.builder(
          itemCount: BlocProvider.of<addaqarcuibt>(context).imageFile.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Stack(children: [
              Image.file(
                File(BlocProvider.of<addaqarcuibt>(context)
                    .imageFile[index]
                    .path),
                fit: BoxFit.cover,
              ),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<addaqarcuibt>(context).removeimage(index);
                  },
                  icon: Icon(Icons.cancel))
            ]);
          });
    });
  }
}
