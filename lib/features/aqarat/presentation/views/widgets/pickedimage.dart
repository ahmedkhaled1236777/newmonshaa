import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class pickedimage extends StatefulWidget {
  ImagePicker picker = ImagePicker();

  @override
  State<pickedimage> createState() => _pickedimageState();
}

class _pickedimageState extends State<pickedimage> {
  uploadImage() async {
    final List<XFile> pickedimage = await widget.picker.pickMultiImage();

    if (pickedimage != null) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<addaqarcuibt>(context)
          .addnewimage(pickedimages: pickedimage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff2BA4C8), width: 0.5)),
      child: MaterialButton(
        padding: const EdgeInsets.all(21),
        onPressed: () {
          uploadImage();
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.image,
              size: 19,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              'اختيار الصور',
              style: TextStyle(fontSize: 12.5),
            ),
          ],
        ),
      ),
    );
  }
}
