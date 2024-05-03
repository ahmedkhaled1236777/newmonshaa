import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class WordFilePage extends StatefulWidget {
  @override
  _WordFilePageState createState() => _WordFilePageState();
}

class _WordFilePageState extends State<WordFilePage> {
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _generateWordFile();
  }

  Future<void> _generateWordFile() async {
    try {
      // Get the temporary directory
      Directory tempDir = await getTemporaryDirectory();
      // Generate a unique file name with .docx extension
      String filePath = '${tempDir.path}/.docx';

      // Write some content to the file
      File file = File(filePath);
      // Ensure content is UTF-8 encoded
      await file.writeAsString('بسم الله الرحمن الرحيم مالك يوم الدين',
          encoding: utf8);

      setState(() {
        _filePath = filePath;
      });
    } catch (e) {
      print('Error generating Word file: $e');
      // Handle error appropriately
    }
  }

  Future<void> _openWordFile() async {
    if (_filePath != null) {
      await OpenFile.open(_filePath);
    } else {
      // Handle error, file not generated yet
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Word File Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _openWordFile,
                child: Text('Open Word File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
